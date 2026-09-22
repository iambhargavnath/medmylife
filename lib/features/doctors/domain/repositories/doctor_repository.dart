import '../../data/models/doctor_list_response.dart';
import '../entities/doctor.dart';

abstract class DoctorRepository {
  Future<DoctorListResponse> getDoctors({
    required int limit,
    required int offset,
    String query
  });

  Future<Doctor> getDoctorById(String doctorId);

  Future<Doctor?> getCachedDoctorById(String doctorId);

  Future<void> syncDoctors();
}