import '../../../domain/models/appointment.dart';
import '../../../domain/models/queued_appointment.dart';

abstract class AppointmentQueueDataSource {
  Future<void> add(Appointment appointment);

  Future<List<Appointment>> getPending();

  Future<List<QueuedAppointment>> getAll();

  Future<void> markSyncing(String id);

  Future<void> markSynced(String id);

  Future<void> markFailed(String id);

  Future<void> incrementRetryCount(String id);

  Future<void> remove(String id);
}