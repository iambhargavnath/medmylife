import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../datasources/local/doctor_cache_data_source.dart';
import '../datasources/remote/doctor_remote_data_source.dart';
import '../models/doctor_list_response.dart';

class DoctorRepositoryImpl
    implements DoctorRepository {
  final DoctorRemoteDataSource remoteDataSource;
  final DoctorCacheDataSource cacheDataSource;

  DoctorRepositoryImpl({
    required this.remoteDataSource,
    required this.cacheDataSource,
  });

  @override
  Future<DoctorListResponse> getDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    try {
      final remoteResult =
      await remoteDataSource.getDoctors(
        limit: limit,
        offset: offset,
        query: query,
      );

      await cacheDataSource.saveDoctors(
        remoteResult.doctors,
      );

      return remoteResult;
    } catch (error) {
      final cachedDoctors =
      await cacheDataSource.getDoctors(
        limit: limit,
        offset: offset,
        query: query,
      );

      if (cachedDoctors.isEmpty) {
        rethrow;
      }

      final cachedTotal =
      await cacheDataSource.getDoctorCount(
        query: query,
      );

      return DoctorListResponse(
        doctors: cachedDoctors,
        total: cachedTotal,
        limit: limit,
        offset: offset,
        isFromCache: true,
      );
    }
  }

  @override
  Future<Doctor> getDoctorById(
      String doctorId,
      ) async {
    try {
      final doctor =
      await remoteDataSource.getDoctorById(
        doctorId,
      );

      await cacheDataSource.saveDoctors(
        [doctor],
      );

      return doctor;
    } catch (_) {
      final cachedDoctor =
      await cacheDataSource.getDoctorById(
        doctorId,
      );

      if (cachedDoctor != null) {
        return cachedDoctor;
      }

      rethrow;
    }
  }

  @override
  Future<Doctor?> getCachedDoctorById(
      String doctorId,
      ) {
    return cacheDataSource.getDoctorById(
      doctorId,
    );
  }

  @override
  Future<void> syncDoctors() async {
    final result = await remoteDataSource.getDoctors(
      limit: 50,
      offset: 0,
      query: '',
    );

    await cacheDataSource.replaceDoctors(
      result.doctors,
    );
  }

}