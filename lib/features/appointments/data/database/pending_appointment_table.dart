import 'package:drift/drift.dart';

class PendingAppointments extends Table {
  TextColumn get id => text()();

  TextColumn get doctorId => text()();

  TextColumn get doctorName => text()();

  TextColumn get speciality => text()();

  TextColumn get slot => text()();

  RealColumn get consultationFee => real()();

  TextColumn get status => text()();

  IntColumn get retryCount =>
      integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt =>
      dateTime()();

  DateTimeColumn get updatedAt =>
      dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}