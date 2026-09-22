import 'package:drift/drift.dart';

import 'pending_appointment_table.dart';

part 'appointment_database.g.dart';

@DriftDatabase(
  tables: [
    PendingAppointments,
  ],
)
class AppointmentDatabase
    extends _$AppointmentDatabase {
  AppointmentDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
      );

  Future<void> clearLocalAppointments() async {
    await delete(pendingAppointments).go();
  }
}