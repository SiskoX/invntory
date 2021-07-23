


import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
 

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'moorRaw.g.dart';


class RawMaterials extends Table{
  IntColumn get id => integer().autoIncrement().customConstraint('UNIQUE')();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get desc => text().named('body')();
  DateTimeColumn get date => dateTime().nullable()();
  RealColumn get price => real().nullable()();

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rdb.sqlite'));
    return VmDatabase(file);
  });
}


@UseMoor(tables: [RawMaterials])
class RawMaterialsDatabase extends _$RawMaterialsDatabase {
 RawMaterialsDatabase() :  super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  
  @override
  int get schemaVersion => 1;
  
Future<List<RawMaterial>> get allProducts =>select(rawMaterials).get();
Future insertProduct(RawMaterial rawMaterial) {
    return into(rawMaterials).insert(rawMaterial);
  }



Stream<List<RawMaterial>> watchallProducts() => select(rawMaterials).watch();

// Future insertProduct(Product product)=> into(products).insert(product);

Future updateroduct(RawMaterial rawMaterial)=> update(rawMaterials).replace(rawMaterial);

Future deleteProduct(RawMaterial rawMaterial)=> delete(rawMaterials).delete(rawMaterial);


}

