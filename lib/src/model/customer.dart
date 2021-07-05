final String tableCustomer = 'customer';

class CustomerField{

  static final String id = '_id';
  static final String name = 'name';
  static final String location = 'location';
  static final String phonenumber  = phonenumber;
  static final String  tinnumber = tinnumber;
  
  
}

class Customer{
  final int id ;
  final String name;
  final String location;
  final int phonenumber;
  final int tinnumber;

  const Customer({
    required this.id, 
    required this.name, 
    required this.location, 
    required this.phonenumber,
    required this.tinnumber,
}
  );

  Customer delete({
    int? id,
    String? name,
    String? location,
    int? phonenumber,
    int? tinnumber,
  })=>
  Customer(
    id: id ?? this .id,
    name: name ?? this.name,
    location:  location ?? this.location,
    phonenumber:  phonenumber ?? this.phonenumber,
    tinnumber: tinnumber ?? this.tinnumber,
  );
   Map <String , Object>toJson()=>{
    CustomerField.id : id,
    CustomerField.phonenumber : phonenumber,
    CustomerField.location :location,
    CustomerField.name : name,
    CustomerField.tinnumber:tinnumber,

    
  };

  Customer copy({
    int? id,
    String? name,
    String? location,
    int? phonenumber,
    int? tinnumber,
    

  })=>
  Customer(
    id: id ?? this.id,
    name : name ?? this.name,
    location :   location ?? this.location,
    phonenumber: phonenumber ?? this.phonenumber,
    tinnumber: tinnumber ?? this.tinnumber,

  );
  static Customer fromJson(Map<String, Object?>json)=>Customer( 
    id: json[CustomerField.id] as int,

    name: json[CustomerField.name]as String,
    location: json[CustomerField.location] as String,
    phonenumber: json[CustomerField.phonenumber]as int,
    tinnumber: json[CustomerField.tinnumber]as int,

  );

}
