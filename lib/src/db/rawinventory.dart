// import 'dart:async';

// import 'package:inventory/src/view/rawinv.dart';
// import 'package:sqflite/sqflite.dart';

// import 'package:inventory/src/model/rawmodel.dart';
// import 'package:path/path.dart';


// class RawInvtDatabaseHelper{
//   // static const _dbame = 'rawMaterial.db';
//   static final  RawInvtDatabaseHelper instance =  RawInvtDatabaseHelper._init();
//   // static const _dbVersion  =1;
//   static final colId    = 'id';
//   static final colName  = 'name';
//   static final colDesc  = 'desc';
//   static final colPrice = 'price';
//   static final colDate  = 'date';


  
//   // static Database? db;
//   RawInvtDatabaseHelper._init();


//   Future <Database> get database async{
//     if (db !=null) return db!;

//     db = await _initDB('rawMaterial.db');
//     return db!;
//   }
  
 
//   Future<Database> _initDB (String filePath)async{
//      final dbpath = await getDatabasesPath();
//     final path = join(dbpath,filePath);

//     return await openDatabase(path,version: 4,onCreate: createDatabase);

//   }


//   Future createDatabase(Database db, int version) async{
//     // final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  
//     // final textType = 'TEXT NOT NULL';
//     // final doubleType = 'DOUBLE NOT NULL';
//     // final dateType = 'DATE';

//     await db.execute('''
        
//           CREATE TABLE $tblRawM (
//             $colId INTEGER PRIMARY KEY,
//             $colName TEXT NOT NULL,
//             $colPrice REAL,
//             $colDesc TEXT NOT NULL,
//             $colDate DATE
//           )
//           ''');

       


          

//   }

//   Future <int>create(RawInvntory rawInvnt)async{

//      final db  = await instance.database;
//      return  await db.insert(tblRawM, rawInvnt.toMap(), );

     

//   }

//   Future <int> update(RawInvntory rawInvnt)async{
//     final db  = await instance.database;

//     return db.update(tblRawM, 
//                      rawInvnt.toMap(),
//                      where: '${RawInvntory.colId}=?',
//                      whereArgs: [rawInvnt.id]
//                      );
//   }
  
//   Future<int> delete (int id )async{
//     final db = await instance.database;

//     return await db.delete(tblRawM,
//                            where: '${RawInvntory.colId}=?',
//                            whereArgs: [id]);
//   } 

//   Future <List<RawInvntory>>listAll()async{
//     final db = await instance.database;
   
    
//     final result =await db.query(tblRawM);
//      return result.length == 0
//       ? []
//       : result.map((x) => RawInvntory.fromMap(x)).toList();
//   }

//   Future close()async{
//     final db = await instance.database;
//     db.close();

//   }
// }

  

   

  


 
  
