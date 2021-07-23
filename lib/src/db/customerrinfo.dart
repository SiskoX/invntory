// import 'dart:async';

// import 'package:sqflite/sqflite.dart';
// import 'package:inventory/src/model/customer.dart';
// import 'package:path/path.dart';

// class CustomerDatabase{
//   static final CustomerDatabase instance = CustomerDatabase._init();
//    static const colId = 'id';
//   static const colName  = 'name';
//   static const colLocation  = 'location';
//   static const colPhone  = 'phonenum'; 
//   static const colTin = 'tinnumber';  

//   static Database? _database;
//   CustomerDatabase._init();

// Future <Database> get database async{
//   if(_database!=null) return _database!;

//   _database =  await _initDB('customer.db');
//   return _database!;

// }

//  Future<Database> _initDB(String filePath)async {

//    final dpath = await getDatabasesPath();
//    final path  = join(dpath,filePath);

//    return await openDatabase(path, version: 1,onCreate: _createDatabase);

//   }


//   Future  _createDatabase(Database db, int version) async {
   
  
//     // final boolType = 'BOOLEAN NOT NULL';
    
//     await db.execute('''
//      CREATE TABLE $tableCustomer(
//        $colId INTEGER PRIMARY KEY,
//        $colTin INTEGER NOT NULL,
//        $colName TEXT NOT NULL,
//        $colPhone INTEGER NOT NULL,
//        $colLocation TEXT NOT NULL

   
      


//      )
//     ''');
//   }
//   Future create (CustomerModel _productModel)async{
//     final db  = await instance.database;
    
//      return  await db.insert(tableCustomer ,_productModel.toMap());


    

//   } 
//    Future <int> update(CustomerModel _customerModel)async{
//     final db  = await instance.database;

//     return db.update(tableCustomer, 
//                      _customerModel.toMap(),
//                      where: '${CustomerModel.colId}=?',
//                      whereArgs: [_customerModel.id]
//                      );
//   }
  
//    Future <List<CustomerModel>>listAll()async{
//     final db = await instance.database;
   
    
//     final result =await db.query(tableCustomer);
//      return result.length == 0
//       ? []
//       : result.map((x) => CustomerModel.fromMap(x)).toList();
//   }
//  Future<int> delete (int id )async{
//     final db = await instance.database;

//     return await db.delete(tableCustomer,
//                            where: '${CustomerModel.colId}=?',
//                            whereArgs: [id]);
//   } 

//   Future close() async{
//     final db  = await instance.database;
//     db.close();
//   }

   

// }


