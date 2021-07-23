 
import 'package:inventory/src/view/productadd.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:inventory/src/model/productmodel.dart';
import 'package:path/path.dart';

class ProductDatabase{
  static final ProductDatabase instance = ProductDatabase._init();

  static final colId    = 'id';
  static final colName  = 'name';
  static final colDesc  = 'desc';
  static final colPrice = 'price';
  static final colDate  = 'date';
  static final colPhoto = 'photo';

  // static Database? db;
  ProductDatabase._init();

  // Future<Database> get database async{
  //   if (db!= null) return db!;

  //   db = await _initDB('products.db');
  //   return db!;
    
  // }
 

//   Future <Database> _initDB (String filePath)async {
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath,filePath);

//     return await openDatabase(path, version: 3, onCreate: _createDatabase);
//   }
  
//   Future _createDatabase (Database db, int version) async {
  
    
//       await db.execute('''
//           create table $tableProduct (
//             $colId INTEGER PRIMARY KEY,
//             $colName TEXT NOT NULL,
//             $colPrice REAL,
//             $colDesc TEXT NOT NULL,
//             $colDate DATE ,
//             $colPhoto BLOB)
//           ''');


//   }
// Future savePicture(ProductModel _productModel) async {
//   final db  = await instance.database;
//   return await db.insert("Picture", _productModel.toMap());
// }

//   Future create (ProductModel _productModel)async{
//     final db  = await instance.database;
    
//      return  await db.insert(tableProduct ,_productModel.toMap());

//   }





//     Future <int> update(ProductModel _productModel)async{
//     final db  = await instance.database;

//     return db.update(tableProduct, 
//                      _productModel.toMap(),
//                      where: '${ProductModel.colId}=?',
//                      whereArgs: [_productModel.id]
//                      );
//   }
  
//    Future <List<ProductModel>>listAll()async{
//     final db = await instance.database;
   
    
//     final result =await db.query(tableProduct);
//      return result.length == 0
//       ? []
//       : result.map((x) => ProductModel.fromMap(x)).toList();
//   }
//  Future<int> delete (int id )async{
//     final db = await instance.database;

//     return await db.delete(tableProduct,
//                            where: '${ProductModel.colId}=?',
//                            whereArgs: [id]);
//   } 
// // Future <List<ProductModel>>orderbytime()async{
// //   final db = await instance.database;
// //   DateTime date = DateTime.now();
  
// //   return await db.rawQuery('''SELECT * FROM $tableProduct WHERE $colDate BETWEEN '$twoDaysAgo' AND '$today''');
 
// // }
//   Future close() async{
//     final db  = await instance.database;
//     db.close();
//   }

// Future  <List<Map<String, Object?>>>queryLastTwoDays() async {
//    final db = await instance.database;
  
//     DateTime now = DateTime.now();
//     DateTime oneDayAgoFromNow = now.subtract(Duration(hours: -24));
//     var today = now.millisecondsSinceEpoch;
//     var oneDayAgo = oneDayAgoFromNow.millisecondsSinceEpoch;
//     return await db.rawQuery('''SELECT * FROM $tableProduct WHERE $colDate BETWEEN '$today' AND '$oneDayAgo ' ''');
//   }


// }

}