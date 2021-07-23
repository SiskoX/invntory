// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moorCust.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String name;
  final int? tinnumber;
  final int? phone;
  final String location;
  Customer(
      {required this.id,
      required this.name,
      this.tinnumber,
      this.phone,
      required this.location});
  factory Customer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Customer(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      tinnumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tinnumber']),
      phone: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || tinnumber != null) {
      map['tinnumber'] = Variable<int?>(tinnumber);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<int?>(phone);
    }
    map['location'] = Variable<String>(location);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      tinnumber: tinnumber == null && nullToAbsent
          ? const Value.absent()
          : Value(tinnumber),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      location: Value(location),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      tinnumber: serializer.fromJson<int?>(json['tinnumber']),
      phone: serializer.fromJson<int?>(json['phone']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'tinnumber': serializer.toJson<int?>(tinnumber),
      'phone': serializer.toJson<int?>(phone),
      'location': serializer.toJson<String>(location),
    };
  }

  Customer copyWith(
          {int? id,
          String? name,
          int? tinnumber,
          int? phone,
          String? location}) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        tinnumber: tinnumber ?? this.tinnumber,
        phone: phone ?? this.phone,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tinnumber: $tinnumber, ')
          ..write('phone: $phone, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              tinnumber.hashCode, $mrjc(phone.hashCode, location.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.tinnumber == this.tinnumber &&
          other.phone == this.phone &&
          other.location == this.location);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> tinnumber;
  final Value<int?> phone;
  final Value<String> location;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.tinnumber = const Value.absent(),
    this.phone = const Value.absent(),
    this.location = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.tinnumber = const Value.absent(),
    this.phone = const Value.absent(),
    required String location,
  })  : name = Value(name),
        location = Value(location);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int?>? tinnumber,
    Expression<int?>? phone,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tinnumber != null) 'tinnumber': tinnumber,
      if (phone != null) 'phone': phone,
      if (location != null) 'location': location,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? tinnumber,
      Value<int?>? phone,
      Value<String>? location}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      tinnumber: tinnumber ?? this.tinnumber,
      phone: phone ?? this.phone,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tinnumber.present) {
      map['tinnumber'] = Variable<int?>(tinnumber.value);
    }
    if (phone.present) {
      map['phone'] = Variable<int?>(phone.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('tinnumber: $tinnumber, ')
          ..write('phone: $phone, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CustomersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _tinnumberMeta = const VerificationMeta('tinnumber');
  late final GeneratedColumn<int?> tinnumber = GeneratedColumn<int?>(
      'tinnumber', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<int?> phone = GeneratedColumn<int?>(
      'phone', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, tinnumber, phone, location];
  @override
  String get aliasedName => _alias ?? 'customers';
  @override
  String get actualTableName => 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tinnumber')) {
      context.handle(_tinnumberMeta,
          tinnumber.isAcceptableOrUnknown(data['tinnumber']!, _tinnumberMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Customer.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(_db, alias);
  }
}

abstract class _$CustomerDatabase extends GeneratedDatabase {
  _$CustomerDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CustomersTable customers = $CustomersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customers];
}
