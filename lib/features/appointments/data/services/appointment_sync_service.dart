import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/appointment_repository.dart';
import '../datasources/local/appointment_queue_data_source.dart';

class AppointmentSyncService {
  final AppointmentQueueDataSource queue;
  final AppointmentRepository repository;
  final Connectivity connectivity;

  StreamSubscription<List<ConnectivityResult>>?
  _connectivitySubscription;

  AppointmentSyncService({
    required this.queue,
    required this.repository,
    Connectivity? connectivity,
  }) : connectivity = connectivity ?? Connectivity();

  Future<void> syncPendingAppointments() async {
    final appointments = await queue.getPending();

    for (final appointment in appointments) {
      try {
        await queue.markSyncing(appointment.id);

        await repository.bookAppointment(
          doctorId: appointment.doctorId,
          doctorName: appointment.doctorName,
          speciality: appointment.speciality,
          slot: appointment.slot,
          consultationFee: appointment.consultationFee,
          allowQueue: false,
        );

        await queue.markSynced(
          appointment.id,
        );
      } catch (_) {
        await queue.incrementRetryCount(
          appointment.id,
        );

        await queue.markFailed(
          appointment.id,
        );
      }
    }
  }

  void startListening() {
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(
              (results) async {
            final isOnline = results.any(
                  (result) =>
              result != ConnectivityResult.none,
            );

            if (isOnline) {
              await syncPendingAppointments();
            }
          },
        );
  }

  Future<void> dispose() async {
    await _connectivitySubscription?.cancel();
  }

  Future<void> retry(String appointmentId) async {
    final appointments = await queue.getPending();

    final appointment = appointments.firstWhere(
          (item) => item.id == appointmentId,
    );

    try {
      await queue.markSyncing(
        appointment.id,
      );

      await repository.bookAppointment(
        doctorId: appointment.doctorId,
        doctorName: appointment.doctorName,
        speciality: appointment.speciality,
        slot: appointment.slot,
        consultationFee: appointment.consultationFee,
        allowQueue: false,
      );

      await queue.markSynced(
        appointment.id,
      );
    } catch (_) {
      await queue.incrementRetryCount(
        appointment.id,
      );

      await queue.markFailed(
        appointment.id,
      );

      rethrow;
    }
  }

}