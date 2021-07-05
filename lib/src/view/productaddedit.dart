import 'package:flutter/material.dart';
import 'package:inventory/src/db/db.dart';
import 'package:inventory/src/model/productmodel.dart';
import 'package:inventory/src/model/rawmodel.dart';
import 'package:inventory/src/widget/productform.dart';

class ProductAddPage extends StatefulWidget{
  final Product? product;

  const ProductAddPage({
    Key? key,
    this.product,
  }):super(key: key);

  @override 

  _ProductAddPageState createState()=>_ProductAddPageState();

}

class  _ProductAddPageState extends State<ProductAddPage>{
  final _formKey = GlobalKey<FormState>();
  late String description;
  late String name;
  late String imagePath;
  late int numberofproduct;
  late double price;

  TextEditingController nameController = TextEditingController();
 TextEditingController priceController = TextEditingController();
 TextEditingController descController = TextEditingController();
  @override
  void initState(){
    super.initState();
   

  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      
      body:  ListView(
        children: [
          Form(
            key:  _formKey,
            child: ProductFormWidget(
              onChangedDescrption: (description)=>setState(()=>this.description=description),
              onChangedName: (name)=>setState(()=>this.name),
              onChangedPrice: (price)=>setState(()=>this.price=price), 
              onChangedImage: (imagePath)=>setState(()=>this.imagePath) ,
              

              ),
              

            ),
   
        ],
      ),
       
        
      
      );
      
       
      
   
  }
  // Widget saveButton(){
  //   final isFormValid = name.isNotEmpty && description.isNotEmpty;
  //    return Padding(
  //               padding: const EdgeInsets.all(10.0),
                
       
  //                 child: Container(
  //                   width: double.infinity,
  //                   height: 30,
  //                   child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         shadowColor: Colors.blueAccent,
  //         //shape:,
  //         onPrimary: Colors.lightBlue,
  //         primary: isFormValid ? null : Colors.redAccent
  //       ),
  //       onPressed: addOrUpdateNote,
  //       child: Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
  //     ),
                    
  //                 ),
              
  //             );
  // }

  //  addOrUpdateNote() async{
  //   final isValid = _formKey.currentState!.validate();

  //   if (isValid) {
  //     final isUpdating = widget.product != null;

  //     if (isUpdating) {
  //       await updateProduct();
  //     } else {
  //       await addProduct();
  //     }

  //     Navigator.of(context).pop();
  //   }
  
  // }

  // Future updateProduct()async {
  //   final product = RawInvntory(
  //     name: name,
  //     price: price,
  //     desc: desc,
  //   );
  //   await ProductDatabase.instance.update(product);

  // }

 Future addProduct ()async {
    final product = Product( 
      name: name,
      price: price,
      description: description, 
      numberofproduct: numberofproduct, 
      imagePath: imagePath, 
     
      
      

    );
    await ProductDatabase.instance.create(product);
  }
  // form (){
  //   return Form(
  //     key: _formKey,
  //     child:

  //   );
  // }
 
}

