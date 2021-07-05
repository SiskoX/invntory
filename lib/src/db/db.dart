 
import 'package:sqflite/sqflite.dart';
import 'package:inventory/src/model/productmodel.dart';
import 'package:path/path.dart';

class ProductDatabase{
  static final ProductDatabase instance = ProductDatabase._init();
  static Database? _database;
  ProductDatabase._init();

  Future<Database> get database async{
    if (_database!= null) return _database!;

    _database = await _initDB('product.db');
    return _database!;
    
  }
  Future <Database> _initDB (String filePath)async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath,filePath);

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }
  
  Future _createDatabase (Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intgerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final doubleType = 'DOUBLE NOT NULL';
    // final boolType = 'BOOLEAN NOT NULL';
    
    await db.execute('''
     CREATE TABLE $tableProduct(
       ${ProductField.id} $idType,
       ${ProductField.name} $textType,
       ${ProductField.description} $textType,
       ${ProductField.imagePath} $textType,
       ${ProductField.price} $doubleType,
       ${ProductField.numberofproduct} $intgerType,


     )
    ''');


  }

  Future<Product> create (Product product)async{
    final db  = await instance.database;
    
     final id = await db.insert(tableProduct,product.toJson());


    return product.copy(id: id);

  } 
  Future <Product> readProduct(int id) async{

    final db  = await instance.database;
    final maps = await db.query(
      tableProduct,
      columns: ProductField.values, 
      where: '${ProductField.id}=?',
      whereArgs: [id ],
   );
                                              
    if (maps.isNotEmpty){
      return Product.fromJson(maps.first);
    }
    else{
      throw Exception('ID $id not found');
    }
  }
  Future <List<Product>> readAllProduct()async{

    final db = await instance.database;
    

    //  final orderBy = '${ProductField.time}ASC';
    // final result = await db.query(tableProduct.orderBy:orderBy);
    final result = await db.query(tableProduct);
    return result.map((json) => Product.fromJson(json)).toList();

  }
  Future <int> update(Product product)async{
    final db = await instance.database;

    return db.update(
      tableProduct, 
      product.toJson(),
      where: '${ProductField.id}=?',
      whereArgs:[product.id],

      );
  }
  Future <int> delete (int id) async{
    final db = await instance.database;

    return await db.delete(
      tableProduct,
      where: '${ProductField.id}=?',
      whereArgs:[id],
    );
  }
  Future close() async{
    final db  = await instance.database;
    db.close();
  }

   

}

 