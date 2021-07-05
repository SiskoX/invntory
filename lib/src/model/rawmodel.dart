final String tblRawM = 'rawmaterial';

  
class RawInvntory{


   
  // static const tblRawM   ='rawmaterial';
  static const colId = 'id';
  static const colName = 'name';
  static const colDesc = 'desc';
  static const colPrice = 'price';
  static const colDate = 'date';

  late int? id;
  late String name;
  late String desc;
   DateTime? date; 
  late double price;

 RawInvntory({
   this.id,
   required this.name,
   required this.price,
   required this.desc,
   required this.date,
});
 



 RawInvntory.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    desc = map[colDesc];
    price = map[colPrice];
    date = DateTime.parse (map[colDate]);
    
  }

Map <String , dynamic>toMap(){
  var map = <String, dynamic>{colName:name,colPrice:price,colDesc:desc,colDate:date!.toIso8601String()};

  if (id != null) {
      map[colId] = id;
    }
  return map;
}

 
}