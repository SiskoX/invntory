
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';


import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'moorProductdb.g.dart';


class Products extends Table{
  IntColumn get id => integer().autoIncrement().customConstraint('UNIQUE')();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get desc => text().named('body')();
  
  DateTimeColumn get date=> dateTime().nullable()();
  RealColumn get price => real().nullable()();

 

}


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pdb.sqlite'));
    return VmDatabase(file);
  });
}
 


@UseMoor(tables: [Products])
class ProductDatabase extends _$ProductDatabase {
 ProductDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  
  @override
  int get schemaVersion => 1;

Future<List<Product>> get allProducts =>select(products).get();
Future insertProduct(Product product) {
    return into(products).insert(product);
  }

Stream<List<Product>> watchallProducts() => select(products).watch();

// Future insertProduct(Product product)=> into(products).insert(product);

Future updateroduct(Product product)=> update(products).replace(product);

Future deleteProduct(Product product)=> delete(products).delete(product);





 
 
  convertEntityToModel(Product products) {}

// @UseDao(tables:[Products])
// class ProductDao extends DatabaseAccessor<ProductDatabase> with _$ProductDaoMixin{
//   final ProductDatabase db;

//   ProductDao(this.db):super(db);

//   Future<List<Product>> getAllProducts() => select(product).get();
//   Stream<List<Product>> watchAllTasks() => select(products).watch();
//   Future insertTask(Product product) => into(products).insert(product);
//   Future updateroduct(Product product)=> update(products).replace(product);
//   Future deleteProduct(Product product)=> delete(products).delete(product);
// 
}