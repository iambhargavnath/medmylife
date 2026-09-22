import 'package:drift/drift.dart';

import 'doctor_cache_table.dart';

part 'doctor_database.g.dart';

@DriftDatabase(
  tables: [
    CachedDoctors,
  ],
)
class DoctorDatabase extends _$DoctorDatabase {
  DoctorDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (
            Migrator m,
            int from,
            int to,
            ) async {
          if (from < 2) {
            await m.deleteTable('cached_doctors');
            await m.createTable(cachedDoctors);
          }
        },
      );

  Future<List<CachedDoctor>> getCachedDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    final normalizedQuery = query.trim();

    final queryBuilder = select(cachedDoctors);

    if (normalizedQuery.isNotEmpty) {
      queryBuilder.where(
            (doctor) =>
        doctor.name.like('%$normalizedQuery%') |
        doctor.speciality.like('%$normalizedQuery%'),
      );
    }

    queryBuilder
      ..orderBy([
            (doctor) => OrderingTerm.desc(
          doctor.cachedAt,
        ),
      ])
      ..limit(
        limit,
        offset: offset,
      );

    return queryBuilder.get();
  }

  Future<CachedDoctor?> getCachedDoctorById(
      String doctorId,
      ) {
    return (select(cachedDoctors)
      ..where((doctor) => doctor.id.equals(doctorId)))
        .getSingleOrNull();
  }

  Future<int> getCachedDoctorCount({
    String query = '',
  }) async {
    final normalizedQuery = query.trim();

    final queryBuilder = select(cachedDoctors);

    if (normalizedQuery.isNotEmpty) {
      queryBuilder.where(
            (doctor) =>
        doctor.name.like('%$normalizedQuery%') |
        doctor.speciality.like('%$normalizedQuery%'),
      );
    }

    final rows = await queryBuilder.get();

    return rows.length;
  }

  Future<void> upsertDoctors(
      List<CachedDoctorsCompanion> doctors,
      ) async {
    if (doctors.isEmpty) {
      return;
    }

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        cachedDoctors,
        doctors,
      );
    });
  }

  Future<void> trimDoctorCache({
    required int maxRecords,
  }) async {
    await customStatement(
      '''
      DELETE FROM cached_doctors
      WHERE id NOT IN (
        SELECT id
        FROM cached_doctors
        ORDER BY cached_at DESC
        LIMIT ?
      )
      ''',
      [maxRecords],
    );
  }

  Future<void> clearDoctors() async {
    await delete(cachedDoctors).go();
  }


}