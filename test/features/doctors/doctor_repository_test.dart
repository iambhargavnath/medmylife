import 'package:flutter_test/flutter_test.dart';
import 'package:medmylife/features/doctors/data/datasources/local/doctor_cache_data_source.dart';
import 'package:medmylife/features/doctors/data/datasources/remote/doctor_remote_data_source.dart';
import 'package:medmylife/features/doctors/data/models/doctor_list_response.dart';
import 'package:medmylife/features/doctors/data/repositories/doctor_repository_impl.dart';
import 'package:medmylife/features/doctors/domain/entities/doctor.dart';

class FakeRemoteDataSource implements DoctorRemoteDataSource {
  final bool shouldFail;

  FakeRemoteDataSource({
    this.shouldFail = false,
  });

  @override
  Future<DoctorListResponse> getDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    if (shouldFail) {
      throw Exception('Network error');
    }

    return DoctorListResponse(
      doctors: [
        const Doctor(
          id: '101',
          name: 'Dr. Rahul Sharma',
          speciality: 'Cardiologist',
          experience: 12,
          consultationFee: 800,
          available: true,
        ),
      ],
      total: 1,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<Doctor> getDoctorById(String doctorId) async {
    return const Doctor(
      id: '101',
      name: 'Dr. Rahul Sharma',
      speciality: 'Cardiologist',
      experience: 12,
      consultationFee: 800,
      available: true,
    );
  }
}

class FakeCacheDataSource implements DoctorCacheDataSource {
  List<Doctor> doctors = [];

  @override
  Future<List<Doctor>> getDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    return doctors.skip(offset).take(limit).toList();
  }

  @override
  Future<Doctor?> getDoctorById(String doctorId) async {
    try {
      return doctors.firstWhere(
            (doctor) => doctor.id == doctorId,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<int> getDoctorCount({
    String query = '',
  }) async {
    return doctors.length;
  }

  @override
  Future<void> saveDoctors(
      List<Doctor> doctors,
      ) async {
    this.doctors.addAll(doctors);
  }

  @override
  Future<void> replaceDoctors(
      List<Doctor> doctors,
      ) async {
    this.doctors = List.from(doctors);
  }
}

void main() {
  group('DoctorRepositoryImpl', () {
    test('should return doctors from remote API when request succeeds', () async {
      final remote = FakeRemoteDataSource();
      final cache = FakeCacheDataSource();

      final repository = DoctorRepositoryImpl(
        remoteDataSource: remote,
        cacheDataSource: cache,
      );

      final result = await repository.getDoctors(
        limit: 10,
        offset: 0,
      );

      expect(result.doctors.length, 1);
      expect(result.doctors.first.name, 'Dr. Rahul Sharma');
      expect(result.isFromCache, false);
    });

    test('should return cached doctors when remote API fails', () async {
      final remote = FakeRemoteDataSource(
        shouldFail: true,
      );

      final cache = FakeCacheDataSource();

      cache.doctors = [
        const Doctor(
          id: '101',
          name: 'Dr. Rahul Sharma',
          speciality: 'Cardiologist',
          experience: 12,
          consultationFee: 800,
          available: true,
        ),
      ];

      final repository = DoctorRepositoryImpl(
        remoteDataSource: remote,
        cacheDataSource: cache,
      );

      final result = await repository.getDoctors(
        limit: 10,
        offset: 0,
      );

      expect(result.doctors.length, 1);
      expect(result.doctors.first.name, 'Dr. Rahul Sharma');
      expect(result.isFromCache, true);
    });

    test('should rethrow error when remote fails and cache is empty', () async {
      final remote = FakeRemoteDataSource(
        shouldFail: true,
      );

      final cache = FakeCacheDataSource();

      final repository = DoctorRepositoryImpl(
        remoteDataSource: remote,
        cacheDataSource: cache,
      );

      expect(
            () => repository.getDoctors(
          limit: 10,
          offset: 0,
        ),
        throwsException,
      );
    });
  });
}