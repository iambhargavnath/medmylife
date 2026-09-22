import 'package:dio/dio.dart';

import '../../../domain/entities/doctor.dart';
import '../../models/doctor_list_response.dart';
import 'doctor_remote_data_source.dart';

class DoctorRemoteDataSourceImpl
    implements DoctorRemoteDataSource {
  final Dio dio;

  DoctorRemoteDataSourceImpl(this.dio);

  static const String _doctorsPath = '/doctors';

  @override
  Future<DoctorListResponse> getDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    final response = await dio.get(
      _doctorsPath,
      queryParameters: {
        'limit': limit,
        'offset': offset,
        if (query.trim().isNotEmpty) 'q': query.trim(),
      },
    );

    final data = response.data;

    if (data is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid doctor list response.',
      );
    }

    return DoctorListResponse.fromJson(data);
  }

  @override
  Future<Doctor> getDoctorById(String doctorId) async {
    final response = await dio.get(
      '$_doctorsPath/$doctorId',
    );

    final data = response.data;

    if (data is! Map<String, dynamic>) {
      throw const FormatException(
        'Invalid doctor response.',
      );
    }

    return Doctor.fromJson(data);
  }
}