import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';

import '../../data/database/appointment_database.dart';

import '../../data/datasources/local/appointment_queue_data_source.dart';
import '../../data/datasources/local/appointment_queue_data_source_impl.dart';

import '../../data/repositories/mock_appointment_repository.dart';

import '../../data/services/appointment_sync_service.dart';
import '../../domain/models/appointment.dart';
import '../../domain/models/appointment_slot.dart';
import '../../domain/models/queued_appointment.dart';
import '../../domain/repositories/appointment_repository.dart';

import '../controllers/appointment_controller.dart';

final appointmentDatabaseProvider =
Provider<AppointmentDatabase>((ref) {
  final database = AppointmentDatabase(
    openDatabaseConnection(
      databaseName: 'medmylife_appointments',
    ),
  );

  ref.onDispose(database.close);

  return database;
});

final appointmentQueueDataSourceProvider =
Provider<AppointmentQueueDataSource>((ref) {
  return AppointmentQueueDataSourceImpl(
    ref.watch(
      appointmentDatabaseProvider,
    ),
  );
});


final appointmentRepositoryProvider =
Provider<AppointmentRepository>((ref) {
  return MockAppointmentRepository(
    queue: ref.watch(
      appointmentQueueDataSourceProvider,
    ),
    simulateBookingFailure: false,
  );
});

final appointmentRepositoryProviderFailed =
Provider<AppointmentRepository>((ref) {
  return MockAppointmentRepository(
    queue: ref.watch(
      appointmentQueueDataSourceProvider,
    ),
    simulateBookingFailure: true,
  );
});

final appointmentControllerProvider =
NotifierProvider<
    AppointmentController,
    AsyncValue<Appointment?>>(
  AppointmentController.new,
);

final appointmentSlotsProvider =
FutureProvider.family<
    List<AppointmentSlot>,
    String>(
      (ref, doctorId) async {
    final repository = ref.watch(
      appointmentRepositoryProvider,
    );

    return repository.getAvailableSlots(
      doctorId: doctorId,
    );
  },
);

final myAppointmentsProvider =
FutureProvider<List<Appointment>>(
      (ref) async {
    final repository = ref.watch(
      appointmentRepositoryProvider,
    );

    return repository.getAppointments();
  },
);

final appointmentSyncServiceProvider = Provider.autoDispose<AppointmentSyncService>((ref) {
  final service = AppointmentSyncService(
    queue: ref.watch(
      appointmentQueueDataSourceProvider,
    ),
    repository: ref.watch(
      appointmentRepositoryProvider,
    ),
  );

  service.startListening();

  ref.onDispose(service.dispose);

  return service;
});

final queuedAppointmentsProvider =
FutureProvider<List<QueuedAppointment>>((ref) async {
  final queue = ref.watch(
    appointmentQueueDataSourceProvider,
  );

  return queue.getAll();
});