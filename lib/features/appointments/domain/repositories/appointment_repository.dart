import '../models/appointment.dart';
import '../models/appointment_slot.dart';

abstract class AppointmentRepository {
  Future<List<AppointmentSlot>> getAvailableSlots({
    required String doctorId,
  });

  Future<Appointment> bookAppointment({
    required String doctorId,
    required String doctorName,
    required String speciality,
    required String slot,
    required double consultationFee,
    bool allowQueue = true,
  });

  Future<List<Appointment>> getAppointments();
}