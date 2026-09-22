import 'queue_status.dart';
import 'appointment.dart';

class QueuedAppointment {
  final Appointment appointment;
  final QueueStatus status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const QueuedAppointment({
    required this.appointment,
    required this.status,
    required this.retryCount,
    required this.createdAt,
    required this.updatedAt,
  });
}