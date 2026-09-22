import 'package:drift/drift.dart';

class CachedDoctors extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get speciality => text()();

  IntColumn get experience => integer()();

  RealColumn get consultationFee => real()();

  BoolColumn get available => boolean()();

  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}