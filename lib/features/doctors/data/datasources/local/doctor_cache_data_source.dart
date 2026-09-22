import '../../../domain/entities/doctor.dart';

abstract class DoctorCacheDataSource {
  Future<List<Doctor>> getDoctors({
    required int limit,
    required int offset,
    String query,
  });

  Future<Doctor?> getDoctorById(String doctorId);

  Future<int> getDoctorCount({
    String query,
  });

  Future<void> saveDoctors(
      List<Doctor> doctors,
      );

  Future<void> replaceDoctors(
      List<Doctor> doctors,
      );
}