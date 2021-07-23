

import 'dart:typed_data';
import 'dart:ui';

final String tableProduct = 'product';




class ProductModel{

  static const colId    = 'id';
  static const colName  = 'name';
  static const colDesc  = 'desc';
  static const colPrice = 'price';
  static const colDate  = 'date';
  static const colPhoto = 'photo';

  int?     id;
  late String   name;
  late String   desc;
  late DateTime date; 
  late double   price;
  //late String  photo;



  
   ProductModel({
    this.id,
   required this.name,
   required this.price,
   required this.desc,
   required this.date,
   //required this.photo,
    


  });




 ProductModel.fromMap(Map<String, dynamic> map) {
    id    = map[colId];
    name  = map[colName];
    desc  = map[colDesc];
    price = map[colPrice];
   // photo = map [colPhoto];
    date  = DateTime.parse (map[colDate]);
    
  }
  Map <String , dynamic>toMap(){
  var map = <String, dynamic>{colName:name,colPrice:price,colDesc:desc,colDate:date.toIso8601String()};

  if (id != null) {
      map[colId] = id;
    }
  return map;
}

}