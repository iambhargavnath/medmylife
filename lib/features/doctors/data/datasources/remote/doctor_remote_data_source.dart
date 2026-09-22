import '../../models/doctor_list_response.dart';
import '../../../domain/entities/doctor.dart';

abstract class DoctorRemoteDataSource {
  Future<DoctorListResponse> getDoctors({
    required int limit,
    required int offset,
    String query,
  });

  Future<Doctor> getDoctorById(
      String doctorId,
      );
}