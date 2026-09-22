import 'package:flutter_test/flutter_test.dart';
import 'package:medmylife/features/appointments/data/datasources/local/appointment_queue_data_source.dart';
import 'package:medmylife/features/appointments/data/repositories/mock_appointment_repository.dart';
import 'package:medmylife/features/appointments/domain/models/appointment.dart';
import 'package:medmylife/features/appointments/domain/models/queued_appointment.dart';

class FakeAppointmentQueueDataSource
    implements AppointmentQueueDataSource {
  final List<Appointment> pending = [];

  @override
  Future<void> add(Appointment appointment) async {
    pending.add(appointment);
  }

  @override
  Future<List<Appointment>> getPending() async {
    return List.unmodifiable(pending);
  }

  @override
  Future<List<QueuedAppointment>> getAll() async {
    return [];
  }

  @override
  Future<void> markSyncing(String id) async {}

  @override
  Future<void> markSynced(String id) async {}

  @override
  Future<void> markFailed(String id) async {}

  @override
  Future<void> incrementRetryCount(String id) async {}

  @override
  Future<void> remove(String id) async {}
}

void main() {
  group('MockAppointmentRepository', () {
    test('should successfully book an appointment', () async {
      final queue = FakeAppointmentQueueDataSource();

      final repository = MockAppointmentRepository(
        queue: queue,
      );

      final appointment = await repository.bookAppointment(
        doctorId: '101',
        doctorName: 'Dr. Rahul Sharma',
        speciality: 'Cardiologist',
        slot: '10:30 AM',
        consultationFee: 800,
      );

      expect(appointment.doctorId, '101');
      expect(appointment.doctorName, 'Dr. Rahul Sharma');
      expect(appointment.slot, '10:30 AM');
      expect(appointment.consultationFee, 800);
    });

    test(
      'should throw exception when booking fails',
          () async {
        final queue = FakeAppointmentQueueDataSource();

        final repository = MockAppointmentRepository(
          queue: queue,
          simulateBookingFailure: true,
        );

        expect(
              () => repository.bookAppointment(
            doctorId: '101',
            doctorName: 'Dr. Rahul Sharma',
            speciality: 'Cardiologist',
            slot: '10:30 AM',
            consultationFee: 800,
          ),
          throwsException,
        );

        expect(queue.pending.length, 0);
      },
    );
  });
}