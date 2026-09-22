import 'package:drift/drift.dart';

import '../../../domain/models/appointment.dart';
import '../../../domain/models/queue_status.dart';
import '../../../domain/models/queued_appointment.dart';
import '../../database/appointment_database.dart';
import 'appointment_queue_data_source.dart';

class AppointmentQueueDataSourceImpl
    implements AppointmentQueueDataSource {
  final AppointmentDatabase database;

  AppointmentQueueDataSourceImpl(this.database);

  @override
  Future<void> add(
      Appointment appointment,
      ) async {
    final now = DateTime.now();

    await database
        .into(database.pendingAppointments)
        .insert(
      PendingAppointmentsCompanion.insert(
        id: appointment.id,
        doctorId: appointment.doctorId,
        doctorName: appointment.doctorName,
        speciality: appointment.speciality,
        slot: appointment.slot,
        consultationFee: appointment.consultationFee,
        status: QueueStatus.pending.value,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  @override
  Future<List<QueuedAppointment>> getAll() async {
    final rows = await (
        database.select(
          database.pendingAppointments,
        )..orderBy([
              (table) => OrderingTerm(
            expression: table.createdAt,
            mode: OrderingMode.desc,
          ),
        ])
    ).get();

    return rows.map((row) {
      return QueuedAppointment(
        appointment: _toAppointment(row),
        status: QueueStatus.fromValue(
          row.status,
        ),
        retryCount: row.retryCount,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );
    }).toList();
  }

  @override
  Future<List<Appointment>> getPending() async {
    final rows = await (
        database.select(
          database.pendingAppointments,
        )..where(
              (table) =>
          table.status.equals(
            QueueStatus.pending.value,
          ) |
          table.status.equals(
            QueueStatus.failed.value,
          ),
        )..orderBy([
              (table) => OrderingTerm(
            expression: table.createdAt,
          ),
        ])
    ).get();

    return rows.map(_toAppointment).toList();
  }

  @override
  Future<void> markSyncing(String id) async {
    await (
        database.update(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).write(
      PendingAppointmentsCompanion(
        status: Value(
          QueueStatus.syncing.value,
        ),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> markSynced(String id) async {
    await (
        database.update(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).write(
      PendingAppointmentsCompanion(
        status: Value(
          QueueStatus.synced.value,
        ),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> markFailed(String id) async {
    await (
        database.update(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).write(
      PendingAppointmentsCompanion(
        status: Value(
          QueueStatus.failed.value,
        ),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> incrementRetryCount(String id) async {
    final appointment = await (
        database.select(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).getSingleOrNull();

    if (appointment == null) {
      return;
    }

    await (
        database.update(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).write(
      PendingAppointmentsCompanion(
        retryCount: Value(
          appointment.retryCount + 1,
        ),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> remove(String id) async {
    await (
        database.delete(
          database.pendingAppointments,
        )..where(
              (table) => table.id.equals(id),
        )
    ).go();
  }

  Appointment _toAppointment(
      PendingAppointment row,
      ) {
    return Appointment(
      id: row.id,
      doctorId: row.doctorId,
      doctorName: row.doctorName,
      speciality: row.speciality,
      slot: row.slot,
      consultationFee: row.consultationFee,
    );
  }
}