class AppointmentSlot {
  final String id;
  final String doctorId;
  final String time;
  final bool available;

  const AppointmentSlot({
    required this.id,
    required this.doctorId,
    required this.time,
    required this.available,
  });

  factory AppointmentSlot.fromJson(
      Map<String, dynamic> json,
      ) {
    return AppointmentSlot(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      time: json['time'] as String,
      available: json['available'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'time': time,
      'available': available,
    };
  }
}