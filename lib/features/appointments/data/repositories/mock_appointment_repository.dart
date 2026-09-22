import '../../domain/models/appointment.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../../domain/models/appointment_slot.dart';
import '../datasources/local/appointment_queue_data_source.dart';

class MockAppointmentRepository
    implements AppointmentRepository {
  final AppointmentQueueDataSource queue;

  final List<Appointment> _appointments = [];

  bool simulateBookingFailure;

  MockAppointmentRepository({
    required this.queue,
    this.simulateBookingFailure = false,
  });

  @override
  Future<List<AppointmentSlot>> getAvailableSlots({
    required String doctorId,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return [
      AppointmentSlot(
        id: '$doctorId-slot-1',
        doctorId: doctorId,
        time: '09:00 AM',
        available: true,
      ),
      AppointmentSlot(
        id: '$doctorId-slot-2',
        doctorId: doctorId,
        time: '10:30 AM',
        available: true,
      ),
      AppointmentSlot(
        id: '$doctorId-slot-3',
        doctorId: doctorId,
        time: '12:00 PM',
        available: true,
      ),
      AppointmentSlot(
        id: '$doctorId-slot-4',
        doctorId: doctorId,
        time: '03:00 PM',
        available: true,
      ),
      AppointmentSlot(
        id: '$doctorId-slot-5',
        doctorId: doctorId,
        time: '04:30 PM',
        available: true,
      ),
    ];
  }

  @override
  Future<Appointment> bookAppointment({
    required String doctorId,
    required String doctorName,
    required String speciality,
    required String slot,
    required double consultationFee,
    bool allowQueue = true,
  }) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final appointment = Appointment(
      id: 'appointment-${DateTime.now().microsecondsSinceEpoch}',
      doctorId: doctorId,
      doctorName: doctorName,
      speciality: speciality,
      slot: slot,
      consultationFee: consultationFee,
    );

    try {
      if (simulateBookingFailure) {
        throw Exception(
          'Unable to connect to booking server',
        );
      }

      _appointments.add(appointment);

      return appointment;
    } catch (_) {
      if (allowQueue) {
        await queue.add(appointment);
      }

      rethrow;
    }
  }

  @override
  Future<List<Appointment>> getAppointments() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return List.unmodifiable(
      _appointments,
    );
  }
}