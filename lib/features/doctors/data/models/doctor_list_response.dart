import '../../domain/entities/doctor.dart';

class DoctorListResponse {
  final List<Doctor> doctors;
  final int total;
  final int limit;
  final int offset;
  final bool isFromCache;

  const DoctorListResponse({
    required this.doctors,
    required this.total,
    required this.limit,
    required this.offset,
    this.isFromCache = false,
  });

  factory DoctorListResponse.fromJson(
      Map<String, dynamic> json,
      ) {
    final data = json['data'] as List<dynamic>;
    final pagination =
    json['pagination'] as Map<String, dynamic>;

    return DoctorListResponse(
      doctors: data
          .map(
            (item) => Doctor.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      total: (pagination['total'] as num).toInt(),
      limit: (pagination['limit'] as num).toInt(),
      offset: (pagination['offset'] as num).toInt(),
    );
  }
}