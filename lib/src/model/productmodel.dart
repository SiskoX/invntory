

import 'dart:ui';

final String tableProduct = 'product';



class ProductField{
  static final List<String> values= [
    id,name,description,imagePath,numberofproduct
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String description = 'description';
  static final String imagePath = 'imagePath';
  static final String numberofproduct = numberofproduct;
  static final String price = price;
  
  
}
class Product {
  final int? id;
  final String name;
  final String description;
  final String imagePath;
  final int numberofproduct;
  final double price;
  
  const Product({
    this.id,
   
   required this.name,
   
    required this.description,
    required this.imagePath,
    required this.numberofproduct,
    required this.price,
    


  });
Product delete({
   int? id,
   String? name,
   String? description,
   String? imagePath,
   int? numberofproduct,
   double? price, 
})=>
Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description:description?? this.description,
      imagePath: imagePath?? this.imagePath,
      numberofproduct:numberofproduct?? this.numberofproduct,
      price : price?? this.price,
  );



 Product copy({
   int? id,
   String? name,
   String? description,
   String? imagePath,
   int? numberofproduct,
   double? price,


 })=>
    Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description:description?? this.description,
      imagePath: imagePath?? this.imagePath,
      numberofproduct:numberofproduct ?? this.numberofproduct,
      price: price ?? this.price as double,
    );

  static Product fromJson(Map<String, Object?>json)=>Product( 
    id: json[ProductField.id] as int,
    imagePath: json[ProductField.imagePath]as String,
    name: json[ProductField.name]as String,
    description: json[ProductField.description] as String,
    numberofproduct: json[ProductField.numberofproduct]as int,
    price: json[ProductField.price]as double,

  );
  Map<String, Object?> toJson()=>{

    ProductField.id : id,
    ProductField.name :name,
    ProductField.description : description,
    ProductField.imagePath :imagePath,
    ProductField.numberofproduct : numberofproduct,
    ProductField.price:price,


  };

}