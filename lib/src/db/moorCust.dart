
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
// import 'package:moor/moor_web.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'moorCust.g.dart';


class Customers extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2,max: 32)(); 
  IntColumn get tinnumber => integer().nullable()();
  IntColumn get phone => integer().nullable()(); 
  TextColumn get location => text().withLength(min:2,max: 32) ();
}


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cdb.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor (tables :[Customers])
class CustomerDatabase extends _$CustomerDatabase{
   CustomerDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;



Future<List<Customer>> get allCustomers =>select(customers).get();
Future insertProduct(Customer customer) {
    return into(customers).insert(customer);
  }

Stream<List<Customer>> watchallCustomers() => select(customers).watch();

// Future insertProduct(Product product)=> into(products).insert(product);

Future updateroduct(Customer customer)=> update(customers).replace(customer);

Future deleteProduct(Customer customer)=> delete(customers).delete(customer);

}