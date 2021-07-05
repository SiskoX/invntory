import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:inventory/src/model/customer.dart';
import 'package:path/path.dart';

class CustomerDatabase{
  static final CustomerDatabase instance = CustomerDatabase._init();
  static Database? _database;
  CustomerDatabase._init();

Future <Database> get database async{
  if(_database!=null) return _database!;

  _database =  await _initDB('customer.db');
  return _database!;

}

 Future<Database> _initDB(String filePath)async {

   final dpath = await getDatabasesPath();
   final path  = join(dpath,filePath);

   return await openDatabase(path, version: 1,onCreate: _createDatabase);

  }


  FutureOr<void> _createDatabase(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intgerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
  
    // final boolType = 'BOOLEAN NOT NULL';
    
    await db.execute('''
     CREATE TABLE $tableCustomer(
       ${CustomerField.id} $idType,
       ${CustomerField.name} $textType,
       ${CustomerField.location} $textType,
       ${CustomerField.phonenumber} $intgerType,
       ${CustomerField.tinnumber} $intgerType,
      


     )
    ''');
  }
}


