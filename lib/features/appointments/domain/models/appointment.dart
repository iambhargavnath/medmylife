class Appointment {
  final String id;
  final String doctorId;
  final String doctorName;
  final String speciality;
  final String slot;
  final double consultationFee;

  const Appointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.speciality,
    required this.slot,
    required this.consultationFee,
  });

  factory Appointment.fromJson(
      Map<String, dynamic> json,
      ) {
    return Appointment(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      doctorName: json['doctorName'] as String,
      speciality: json['speciality'] as String,
      slot: json['slot'] as String,
      consultationFee:
      (json['consultationFee'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'speciality': speciality,
      'slot': slot,
      'consultationFee': consultationFee,
    };
  }
}