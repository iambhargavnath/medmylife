import 'package:drift/drift.dart';

import 'package:medmylife/features/doctors/data/database/doctor_database.dart';
import '../../../domain/entities/doctor.dart';
import 'doctor_cache_data_source.dart';

class DoctorCacheDataSourceImpl
    implements DoctorCacheDataSource {
  final DoctorDatabase database;

  DoctorCacheDataSourceImpl(this.database);

  static const int _maxCacheSize = 50;

  @override
  Future<List<Doctor>> getDoctors({
    required int limit,
    required int offset,
    String query = '',
  }) async {
    final rows = await database.getCachedDoctors(
      limit: limit,
      offset: offset,
      query: query,
    );

    return rows.map(_toEntity).toList();
  }

  @override
  Future<Doctor?> getDoctorById(
      String doctorId,
      ) async {
    final row = await database.getCachedDoctorById(
      doctorId,
    );

    if (row == null) {
      return null;
    }

    return Doctor(
      id: row.id,
      name: row.name,
      speciality: row.speciality,
      experience: row.experience,
      consultationFee: row.consultationFee,
      available: row.available,
    );
  }

  @override
  Future<int> getDoctorCount({
    String query = '',
  }) {
    return database.getCachedDoctorCount(
      query: query,
    );
  }

  @override
  Future<void> saveDoctors(
      List<Doctor> doctors,
      ) async {
    if (doctors.isEmpty) {
      return;
    }

    final now = DateTime.now();

    final companions = doctors.map(
          (doctor) {
        return CachedDoctorsCompanion(
          id: Value(doctor.id),
          name: Value(doctor.name),
          speciality: Value(doctor.speciality),
          experience: Value(doctor.experience),
          consultationFee:
          Value(doctor.consultationFee),
          available: Value(doctor.available),
          cachedAt: Value(now),
        );
      },
    ).toList();

    await database.upsertDoctors(
      companions,
    );

    await database.trimDoctorCache(
      maxRecords: _maxCacheSize,
    );
  }

  @override
  Future<void> replaceDoctors(
      List<Doctor> doctors,
      ) async {
    final now = DateTime.now();

    final companions = doctors.map(
          (doctor) {
        return CachedDoctorsCompanion(
          id: Value(doctor.id),
          name: Value(doctor.name),
          speciality: Value(doctor.speciality),
          experience: Value(doctor.experience),
          consultationFee:
          Value(doctor.consultationFee),
          available: Value(doctor.available),
          cachedAt: Value(now),
        );
      },
    ).toList();

    await database.transaction(() async {
      await database.delete(
        database.cachedDoctors,
      ).go();

      if (companions.isNotEmpty) {
        await database.upsertDoctors(
          companions,
        );
      }
    });
  }

  Doctor _toEntity(CachedDoctor row) {
    return Doctor(
      id: row.id,
      name: row.name,
      speciality: row.speciality,
      experience: row.experience,
      consultationFee: row.consultationFee,
      available: row.available,
    );
  }
}