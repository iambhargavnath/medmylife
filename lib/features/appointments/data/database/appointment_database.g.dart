// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_database.dart';

// ignore_for_file: type=lint
class $PendingAppointmentsTable extends PendingAppointments
    with TableInfo<$PendingAppointmentsTable, PendingAppointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingAppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doctorIdMeta = const VerificationMeta(
    'doctorId',
  );
  @override
  late final GeneratedColumn<String> doctorId = GeneratedColumn<String>(
    'doctor_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doctorNameMeta = const VerificationMeta(
    'doctorName',
  );
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
    'doctor_name',
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
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    doctorId,
    doctorName,
    speciality,
    slot,
    consultationFee,
    status,
    retryCount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_appointments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingAppointment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('doctor_id')) {
      context.handle(
        _doctorIdMeta,
        doctorId.isAcceptableOrUnknown(data['doctor_id']!, _doctorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorIdMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
        _doctorNameMeta,
        doctorName.isAcceptableOrUnknown(data['doctor_name']!, _doctorNameMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('speciality')) {
      context.handle(
        _specialityMeta,
        speciality.isAcceptableOrUnknown(data['speciality']!, _specialityMeta),
      );
    } else if (isInserting) {
      context.missing(_specialityMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
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
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingAppointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingAppointment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      doctorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_id'],
      )!,
      doctorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_name'],
      )!,
      speciality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speciality'],
      )!,
      slot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slot'],
      )!,
      consultationFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consultation_fee'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PendingAppointmentsTable createAlias(String alias) {
    return $PendingAppointmentsTable(attachedDatabase, alias);
  }
}

class PendingAppointment extends DataClass
    implements Insertable<PendingAppointment> {
  final String id;
  final String doctorId;
  final String doctorName;
  final String speciality;
  final String slot;
  final double consultationFee;
  final String status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PendingAppointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.speciality,
    required this.slot,
    required this.consultationFee,
    required this.status,
    required this.retryCount,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['doctor_id'] = Variable<String>(doctorId);
    map['doctor_name'] = Variable<String>(doctorName);
    map['speciality'] = Variable<String>(speciality);
    map['slot'] = Variable<String>(slot);
    map['consultation_fee'] = Variable<double>(consultationFee);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PendingAppointmentsCompanion toCompanion(bool nullToAbsent) {
    return PendingAppointmentsCompanion(
      id: Value(id),
      doctorId: Value(doctorId),
      doctorName: Value(doctorName),
      speciality: Value(speciality),
      slot: Value(slot),
      consultationFee: Value(consultationFee),
      status: Value(status),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PendingAppointment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingAppointment(
      id: serializer.fromJson<String>(json['id']),
      doctorId: serializer.fromJson<String>(json['doctorId']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      speciality: serializer.fromJson<String>(json['speciality']),
      slot: serializer.fromJson<String>(json['slot']),
      consultationFee: serializer.fromJson<double>(json['consultationFee']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'doctorId': serializer.toJson<String>(doctorId),
      'doctorName': serializer.toJson<String>(doctorName),
      'speciality': serializer.toJson<String>(speciality),
      'slot': serializer.toJson<String>(slot),
      'consultationFee': serializer.toJson<double>(consultationFee),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PendingAppointment copyWith({
    String? id,
    String? doctorId,
    String? doctorName,
    String? speciality,
    String? slot,
    double? consultationFee,
    String? status,
    int? retryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PendingAppointment(
    id: id ?? this.id,
    doctorId: doctorId ?? this.doctorId,
    doctorName: doctorName ?? this.doctorName,
    speciality: speciality ?? this.speciality,
    slot: slot ?? this.slot,
    consultationFee: consultationFee ?? this.consultationFee,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PendingAppointment copyWithCompanion(PendingAppointmentsCompanion data) {
    return PendingAppointment(
      id: data.id.present ? data.id.value : this.id,
      doctorId: data.doctorId.present ? data.doctorId.value : this.doctorId,
      doctorName: data.doctorName.present
          ? data.doctorName.value
          : this.doctorName,
      speciality: data.speciality.present
          ? data.speciality.value
          : this.speciality,
      slot: data.slot.present ? data.slot.value : this.slot,
      consultationFee: data.consultationFee.present
          ? data.consultationFee.value
          : this.consultationFee,
      status: data.status.present ? data.status.value : this.status,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingAppointment(')
          ..write('id: $id, ')
          ..write('doctorId: $doctorId, ')
          ..write('doctorName: $doctorName, ')
          ..write('speciality: $speciality, ')
          ..write('slot: $slot, ')
          ..write('consultationFee: $consultationFee, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    doctorId,
    doctorName,
    speciality,
    slot,
    consultationFee,
    status,
    retryCount,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingAppointment &&
          other.id == this.id &&
          other.doctorId == this.doctorId &&
          other.doctorName == this.doctorName &&
          other.speciality == this.speciality &&
          other.slot == this.slot &&
          other.consultationFee == this.consultationFee &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PendingAppointmentsCompanion extends UpdateCompanion<PendingAppointment> {
  final Value<String> id;
  final Value<String> doctorId;
  final Value<String> doctorName;
  final Value<String> speciality;
  final Value<String> slot;
  final Value<double> consultationFee;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PendingAppointmentsCompanion({
    this.id = const Value.absent(),
    this.doctorId = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.speciality = const Value.absent(),
    this.slot = const Value.absent(),
    this.consultationFee = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingAppointmentsCompanion.insert({
    required String id,
    required String doctorId,
    required String doctorName,
    required String speciality,
    required String slot,
    required double consultationFee,
    required String status,
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       doctorId = Value(doctorId),
       doctorName = Value(doctorName),
       speciality = Value(speciality),
       slot = Value(slot),
       consultationFee = Value(consultationFee),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PendingAppointment> custom({
    Expression<String>? id,
    Expression<String>? doctorId,
    Expression<String>? doctorName,
    Expression<String>? speciality,
    Expression<String>? slot,
    Expression<double>? consultationFee,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (doctorId != null) 'doctor_id': doctorId,
      if (doctorName != null) 'doctor_name': doctorName,
      if (speciality != null) 'speciality': speciality,
      if (slot != null) 'slot': slot,
      if (consultationFee != null) 'consultation_fee': consultationFee,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingAppointmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? doctorId,
    Value<String>? doctorName,
    Value<String>? speciality,
    Value<String>? slot,
    Value<double>? consultationFee,
    Value<String>? status,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PendingAppointmentsCompanion(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      speciality: speciality ?? this.speciality,
      slot: slot ?? this.slot,
      consultationFee: consultationFee ?? this.consultationFee,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (doctorId.present) {
      map['doctor_id'] = Variable<String>(doctorId.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (speciality.present) {
      map['speciality'] = Variable<String>(speciality.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (consultationFee.present) {
      map['consultation_fee'] = Variable<double>(consultationFee.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingAppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('doctorId: $doctorId, ')
          ..write('doctorName: $doctorName, ')
          ..write('speciality: $speciality, ')
          ..write('slot: $slot, ')
          ..write('consultationFee: $consultationFee, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppointmentDatabase extends GeneratedDatabase {
  _$AppointmentDatabase(QueryExecutor e) : super(e);
  $AppointmentDatabaseManager get managers => $AppointmentDatabaseManager(this);
  late final $PendingAppointmentsTable pendingAppointments =
      $PendingAppointmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pendingAppointments];
}

typedef $$PendingAppointmentsTableCreateCompanionBuilder =
    PendingAppointmentsCompanion Function({
      required String id,
      required String doctorId,
      required String doctorName,
      required String speciality,
      required String slot,
      required double consultationFee,
      required String status,
      Value<int> retryCount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PendingAppointmentsTableUpdateCompanionBuilder =
    PendingAppointmentsCompanion Function({
      Value<String> id,
      Value<String> doctorId,
      Value<String> doctorName,
      Value<String> speciality,
      Value<String> slot,
      Value<double> consultationFee,
      Value<String> status,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PendingAppointmentsTableFilterComposer
    extends Composer<_$AppointmentDatabase, $PendingAppointmentsTable> {
  $$PendingAppointmentsTableFilterComposer({
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

  ColumnFilters<String> get doctorId => $composableBuilder(
    column: $table.doctorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingAppointmentsTableOrderingComposer
    extends Composer<_$AppointmentDatabase, $PendingAppointmentsTable> {
  $$PendingAppointmentsTableOrderingComposer({
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

  ColumnOrderings<String> get doctorId => $composableBuilder(
    column: $table.doctorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingAppointmentsTableAnnotationComposer
    extends Composer<_$AppointmentDatabase, $PendingAppointmentsTable> {
  $$PendingAppointmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get doctorId =>
      $composableBuilder(column: $table.doctorId, builder: (column) => column);

  GeneratedColumn<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get speciality => $composableBuilder(
    column: $table.speciality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<double> get consultationFee => $composableBuilder(
    column: $table.consultationFee,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PendingAppointmentsTableTableManager
    extends
        RootTableManager<
          _$AppointmentDatabase,
          $PendingAppointmentsTable,
          PendingAppointment,
          $$PendingAppointmentsTableFilterComposer,
          $$PendingAppointmentsTableOrderingComposer,
          $$PendingAppointmentsTableAnnotationComposer,
          $$PendingAppointmentsTableCreateCompanionBuilder,
          $$PendingAppointmentsTableUpdateCompanionBuilder,
          (
            PendingAppointment,
            BaseReferences<
              _$AppointmentDatabase,
              $PendingAppointmentsTable,
              PendingAppointment
            >,
          ),
          PendingAppointment,
          PrefetchHooks Function()
        > {
  $$PendingAppointmentsTableTableManager(
    _$AppointmentDatabase db,
    $PendingAppointmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingAppointmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingAppointmentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingAppointmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> doctorId = const Value.absent(),
                Value<String> doctorName = const Value.absent(),
                Value<String> speciality = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<double> consultationFee = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingAppointmentsCompanion(
                id: id,
                doctorId: doctorId,
                doctorName: doctorName,
                speciality: speciality,
                slot: slot,
                consultationFee: consultationFee,
                status: status,
                retryCount: retryCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String doctorId,
                required String doctorName,
                required String speciality,
                required String slot,
                required double consultationFee,
                required String status,
                Value<int> retryCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PendingAppointmentsCompanion.insert(
                id: id,
                doctorId: doctorId,
                doctorName: doctorName,
                speciality: speciality,
                slot: slot,
                consultationFee: consultationFee,
                status: status,
                retryCount: retryCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PendingAppointmentsTable, PendingAppointment>(
                    table,
                  ),
                  BaseReferences<
                    _$AppointmentDatabase,
                    $PendingAppointmentsTable,
                    PendingAppointment
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingAppointmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppointmentDatabase,
      $PendingAppointmentsTable,
      PendingAppointment,
      $$PendingAppointmentsTableFilterComposer,
      $$PendingAppointmentsTableOrderingComposer,
      $$PendingAppointmentsTableAnnotationComposer,
      $$PendingAppointmentsTableCreateCompanionBuilder,
      $$PendingAppointmentsTableUpdateCompanionBuilder,
      (
        PendingAppointment,
        BaseReferences<
          _$AppointmentDatabase,
          $PendingAppointmentsTable,
          PendingAppointment
        >,
      ),
      PendingAppointment,
      PrefetchHooks Function()
    >;

class $AppointmentDatabaseManager {
  final _$AppointmentDatabase _db;
  $AppointmentDatabaseManager(this._db);
  $$PendingAppointmentsTableTableManager get pendingAppointments =>
      $$PendingAppointmentsTableTableManager(_db, _db.pendingAppointments);
}
