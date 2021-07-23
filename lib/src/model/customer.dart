final String tableCustomer = 'customer';



class CustomerModel{
  static const colId = 'id';
  static const colName  = 'name';
  static const colLocation  = 'location';
  static const colPhone  = 'phonenum'; 
  static const colTin = 'tinnumber';  


  late int? id ;
  late String name;
  late String location;
  late int phonenumber;
  late int tinnumber;

  

   CustomerModel({
     this.id, 
    required this.name, 
    required this.location, 
    required this.phonenumber,
    required this.tinnumber,
}
  );

 

 CustomerModel.fromMap(Map<String, dynamic> map) {
    id    = map[colId];
    name  = map[colName];
    location  = map[colLocation];
    phonenumber = map[colPhone];
    tinnumber  = map[colTin];
    
  }

Map <String , dynamic>toMap(){
  var map = <String, dynamic>{colName:name,colPhone:phonenumber,colTin:tinnumber};

  if (id != null) {
      map[colId] = id;
    }
  return map;
}

}
