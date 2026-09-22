// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_database.dart';

// ignore_for_file: type=lint
class $CachedDoctorsTable extends CachedDoctors
    with TableInfo<$CachedDoctorsTable, CachedDoctor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedDoctorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialityMeta = const VerificationMeta(
    'speciality',
  );
  @override
  late final GeneratedColumn<String> speciality = GeneratedColumn<String>(
    'speciality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _experienceMeta = const VerificationMeta(
    'experience',
  );
  @override
  late final GeneratedColumn<int> experience = GeneratedColumn<int>(
    'experience',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consultationFeeMeta = const VerificationMeta(
    'consultationFee',
  );
  @override
  late final GeneratedColumn<double> consultationFee = GeneratedColumn<double>(
    'consultation_fee',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availableMeta = const VerificationMeta(
    'available',
  );
  @override
  late final GeneratedColumn<bool> available = GeneratedColumn<bool>(
    'available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("available" IN (0, 1))',
    ),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    speciality,
    experience,
    consultationFee,
    available,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_doctors';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedDoctor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('speciality')) {
      context.handle(
        _specialityMeta,
        speciality.isAcceptableOrUnknown(data['speciality']!, _specialityMeta),
      );
    } else if (isInserting) {
      context.missing(_specialityMeta);
    }
    if (data.containsKey('experience')) {
      context.handle(
        _experienceMeta,
        experience.isAcceptableOrUnknown(data['experience']!, _experienceMeta),
      );
    } else if (isInserting) {
      context.missing(_experienceMeta);
    }
    if (data.containsKey('consultation_fee')) {
      context.handle(
        _consultationFeeMeta,
        consultationFee.isAcceptableOrUnknown(
          data['consultation_fee']!,
          _consultationFeeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_consultationFeeMeta);
    }
    if (data.containsKey('available')) {
      context.handle(
        _availableMeta,
        available.isAcceptableOrUnknown(data['available']!, _availableMeta),
      );
    } else if (isInserting) {
      context.missing(_availableMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedDoctor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedDoctor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      speciality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speciality'],
      )!,
      experience: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}experience'],
      )!,
      consultationFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consultation_fee'],
      )!,
      available: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}available'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedDoctorsTable createAlias(String alias) {
    return $CachedDoctorsTable(attachedDatabase, alias);
  }
}

class CachedDoctor extends DataClass implements Insertable<CachedDoctor> {
  final String id;
  final String name;
  final String speciality;
  final int experience;
  final double consultationFee;
  final bool available;
  final DateTime cachedAt;
  const CachedDoctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.experience,
    required this.consultationFee,
    required this.available,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['speciality'] = Variable<String>(speciality);
    map['experience'] = Variable<int>(experience);
    map['consultation_fee'] = Variable<double>(consultationFee);
    map['available'] = Variable<bool>(available);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedDoctorsCompanion toCompanion(bool nullToAbsent) {
    return CachedDoctorsCompanion(
      id: Value(id),
      name: Value(name),
      speciality: Value(speciality),
      experience: Value(experience),
      consultationFee: Value(consultationFee),
      available: Value(available),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedDoctor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedDoctor(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      speciality: serializer.fromJson<String>(json['speciality']),
      experience: serializer.fromJson<int>(json['experience']),
      consultationFee: serializer.fromJson<double>(json['consultationFee']),
      available: serializer.fromJson<bool>(json['available']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'speciality': serializer.toJson<String>(speciality),
      'experience': serializer.toJson<int>(experience),
      'consultationFee': serializer.toJson<double>(consultationFee),
      'available': serializer.toJson<bool>(available),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedDoctor copyWith({
    String? id,
    String? name,
    String? speciality,
    int? experience,
    double? consultationFee,
    bool? available,
    DateTime? cachedAt,
  }) => CachedDoctor(
    id: id ?? this.id,
    name: name ?? this.name,
    speciality: speciality ?? this.speciality,
    experience: experience ?? this.experience,
    consultationFee: consultationFee ?? this.consultationFee,
    available: available ?? this.available,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedDoctor copyWithCompanion(CachedDoctorsCompanion data) {
    return CachedDoctor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      speciality: data.speciality.present
          ? data.speciality.value
          : this.speciality,
      experience: data.experience.present
          ? data.experience.value
          : this.experience,
      consultationFee: data.consultationFee.present
          ? data.consultationFee.value
          : this.consultationFee,
      available: data.available.present ? data.available.value : this.available,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedDoctor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('speciality: $speciality, ')
          ..write('experience: $experience, ')
          ..write('consultationFee: $consultationFee, ')
          ..write('available: $available, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    speciality,
    experience,
    consultationFee,
    available,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedDoctor &&
          other.id == this.id &&
          other.name == this.name &&
          other.speciality == this.speciality &&
          other.experience == this.experience &&
          other.consultationFee == this.consultationFee &&
          other.available == this.available &&
          other.cachedAt == this.cachedAt);
}

class CachedDoctorsCompanion extends UpdateCompanion<CachedDoctor> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> speciality;
  final Value<int> experience;
  final Value<double> consultationFee;
  final Value<bool> available;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedDoctorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.speciality = const Value.absent(),
    this.experience = const Value.absent(),
    this.consultationFee = const Value.absent(),
    this.available = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedDoctorsCompanion.insert({
    required String id,
    required String name,
    required String speciality,
    required int experience,
    required double consultationFee,
    required bool available,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       speciality = Value(speciality),
       experience = Value(experience),
       consultationFee = Value(consultationFee),
       available = Value(available),
       cachedAt = Value(cachedAt);
  static Insertable<CachedDoctor> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? speciality,
    Expression<int>? experience,
    Expression<double>? consultationFee,
    Expression<bool>? available,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (speciality != null) 'speciality': speciality,
      if (experience != null) 'experience': experience,
      if (consultationFee != null) 'consultation_fee': consultationFee,
      if (available != null) 'available': available,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedDoctorsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? speciality,
    Value<int>? experience,
    Value<double>? consultationFee,
    Value<bool>? available,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedDoctorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      speciality: speciality ?? this.speciality,
      experience: experience ?? this.experience,
      consultationFee: consultationFee ?? this.consultationFee,
      available: available ?? this.available,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (speciality.present) {
      map['speciality'] = Variable<String>(speciality.value);
    }
    if (experience.present) {
      map['experience'] = Variable<int>(experience.value);
    }
    if (consultationFee.present) {
      map['consultation_fee'] = Variable<double>(consultationFee.value);
    }
    if (available.present) {
      map['available'] = Variable<bool>(available.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedDoctorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('speciality: $speciality, ')
          ..write('experience: $experience, ')
          ..write('consultationFee: $consultationFee, ')
          ..write('available: $available, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DoctorDatabase extends GeneratedDatabase {
  _$DoctorDatabase(QueryExecutor e) : super(e);
  $DoctorDatabaseManager get managers => $DoctorDatabaseManager(this);
  late final $CachedDoctorsTable cachedDoctors = $CachedDoctorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cachedDoctors];
}

typedef $$CachedDoctorsTableCreateCompanionBuilder =
    CachedDoctorsCompanion Function({
      required String id,
      required String name,
      required String speciality,
      required int experience,
      required double consultationFee,
      required bool available,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedDoctorsTableUpdateCompanionBuilder =
    CachedDoctorsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> speciality,
      Value<int> experience,
      Value<double> consultationFee,
      Value<bool> available,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedDoctorsTableFilterComposer
    extends Composer<_$DoctorDatabase, $CachedDoctorsTable> {
  $$CachedDoctorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedDoctorsTableOrderingComposer
    extends Composer<_$DoctorDatabase, $CachedDoctorsTable> {
  $$CachedDoctorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedDoctorsTableAnnotationComposer
    extends Composer<_$DoctorDatabase, $CachedDoctorsTable> {
  $$CachedDoctorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => column,
  );

  GeneratedColumn<int> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => column,
  );

  GeneratedColumn<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedDoctorsTableTableManager
    extends
        RootTableManager<
          _$DoctorDatabase,
          $CachedDoctorsTable,
          CachedDoctor,
          $$CachedDoctorsTableFilterComposer,
          $$CachedDoctorsTableOrderingComposer,
          $$CachedDoctorsTableAnnotationComposer,
          $$CachedDoctorsTableCreateCompanionBuilder,
          $$CachedDoctorsTableUpdateCompanionBuilder,
          (
            CachedDoctor,
            BaseReferences<_$DoctorDatabase, $CachedDoctorsTable, CachedDoctor>,
          ),
          CachedDoctor,
          PrefetchHooks Function()
        > {
  $$CachedDoctorsTableTableManager(
    _$DoctorDatabase db,
    $CachedDoctorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedDoctorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedDoctorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedDoctorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> speciality = const Value.absent(),
                Value<int> experience = const Value.absent(),
                Value<double> consultationFee = const Value.absent(),
                Value<bool> available = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedDoctorsCompanion(
                id: id,
                name: name,
                speciality: speciality,
                experience: experience,
                consultationFee: consultationFee,
                available: available,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String speciality,
                required int experience,
                required double consultationFee,
                required bool available,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedDoctorsCompanion.insert(
                id: id,
                name: name,
                speciality: speciality,
                experience: experience,
                consultationFee: consultationFee,
                available: available,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CachedDoctorsTable, CachedDoctor>(table),
                  BaseReferences<
                    _$DoctorDatabase,
                    $CachedDoctorsTable,
                    CachedDoctor
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedDoctorsTableProcessedTableManager =
    ProcessedTableManager<
      _$DoctorDatabase,
      $CachedDoctorsTable,
      CachedDoctor,
      $$CachedDoctorsTableFilterComposer,
      $$CachedDoctorsTableOrderingComposer,
      $$CachedDoctorsTableAnnotationComposer,
      $$CachedDoctorsTableCreateCompanionBuilder,
      $$CachedDoctorsTableUpdateCompanionBuilder,
      (
        CachedDoctor,
        BaseReferences<_$DoctorDatabase, $CachedDoctorsTable, CachedDoctor>,
      ),
      CachedDoctor,
      PrefetchHooks Function()
    >;

class $DoctorDatabaseManager {
  final _$DoctorDatabase _db;
  $DoctorDatabaseManager(this._db);
  $$CachedDoctorsTableTableManager get cachedDoctors =>
      $$CachedDoctorsTableTableManager(_db, _db.cachedDoctors);
}
