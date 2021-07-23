// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moorRaw.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RawMaterial extends DataClass implements Insertable<RawMaterial> {
  final int id;
  final String name;
  final String desc;
  final DateTime? date;
  final double? price;
  RawMaterial(
      {required this.id,
      required this.name,
      required this.desc,
      this.date,
      this.price});
  factory RawMaterial.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RawMaterial(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['body'] = Variable<String>(desc);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double?>(price);
    }
    return map;
  }

  RawMaterialsCompanion toCompanion(bool nullToAbsent) {
    return RawMaterialsCompanion(
      id: Value(id),
      name: Value(name),
      desc: Value(desc),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory RawMaterial.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RawMaterial(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      date: serializer.fromJson<DateTime?>(json['date']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'date': serializer.toJson<DateTime?>(date),
      'price': serializer.toJson<double?>(price),
    };
  }

  RawMaterial copyWith(
          {int? id,
          String? name,
          String? desc,
          DateTime? date,
          double? price}) =>
      RawMaterial(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        date: date ?? this.date,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('RawMaterial(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('date: $date, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(desc.hashCode, $mrjc(date.hashCode, price.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RawMaterial &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.date == this.date &&
          other.price == this.price);
}

class RawMaterialsCompanion extends UpdateCompanion<RawMaterial> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> desc;
  final Value<DateTime?> date;
  final Value<double?> price;
  const RawMaterialsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.date = const Value.absent(),
    this.price = const Value.absent(),
  });
  RawMaterialsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String desc,
    this.date = const Value.absent(),
    this.price = const Value.absent(),
  })  : name = Value(name),
        desc = Value(desc);
  static Insertable<RawMaterial> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<DateTime?>? date,
    Expression<double?>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'body': desc,
      if (date != null) 'date': date,
      if (price != null) 'price': price,
    });
  }

  RawMaterialsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? desc,
      Value<DateTime?>? date,
      Value<double?>? price}) {
    return RawMaterialsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      price: price ?? this.price,
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
    if (desc.present) {
      map['body'] = Variable<String>(desc.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    if (price.present) {
      map['price'] = Variable<double?>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RawMaterialsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('date: $date, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $RawMaterialsTable extends RawMaterials
    with TableInfo<$RawMaterialsTable, RawMaterial> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RawMaterialsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'body', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, desc, date, price];
  @override
  String get aliasedName => _alias ?? 'raw_materials';
  @override
  String get actualTableName => 'raw_materials';
  @override
  VerificationContext validateIntegrity(Insertable<RawMaterial> instance,
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
    if (data.containsKey('body')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['body']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RawMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RawMaterial.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RawMaterialsTable createAlias(String alias) {
    return $RawMaterialsTable(_db, alias);
  }
}

abstract class _$RawMaterialsDatabase extends GeneratedDatabase {
  _$RawMaterialsDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $RawMaterialsTable rawMaterials = $RawMaterialsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [rawMaterials];
}
