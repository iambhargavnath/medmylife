class Doctor {
  final String id;
  final String name;
  final String speciality;
  final int experience;
  final double consultationFee;
  final bool available;

  const Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.experience,
    required this.consultationFee,
    required this.available,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'].toString(),
      name: json['name'] as String,
      speciality: json['speciality'] as String,
      experience: json['experience'] as int,
      consultationFee: (json['consultationFee'] as num).toDouble(),
      available: json['available'] as bool,
    );
  }
}