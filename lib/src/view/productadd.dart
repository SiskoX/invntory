

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/view/productInventory.dart';
import 'package:inventory/src/db/moorProductdb.dart';
import 'package:moor/moor.dart'hide Column;


import 'package:provider/provider.dart';

class ProductAdd extends StatefulWidget{

  @override 
  _ProductAdd createState()=> _ProductAdd();
}

class _ProductAdd extends State<ProductAdd>{
 

 

  TextEditingController nameController  =  TextEditingController();
  TextEditingController priceController =  TextEditingController();
  TextEditingController descController  =  TextEditingController();

  late String desc;
  late String name;
   late int id;
  late double price;
  late DateTime date;
   @override
  void dispose() {
    priceController.dispose();
    nameController.dispose();
    descController.dispose();
   
 
    super.dispose();
  }
 


  
  @override 
  Widget build(BuildContext context){
    return Scaffold(

      body: ListView
      (children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
         
                InkWell(
                  onTap: ()=>{
                     Navigator.pop(context,MaterialPageRoute(builder:(context)=>ProductInventory()))
                   },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ))
            ],),
             Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Add Product ",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
              )
            ],),
                
        addProduct(),

      ],),
    );
  }

  addProduct() {
    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              
                color: Colors.grey[200],
                            
           ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
                controller: nameController,
              
                
                validator: (name)=>
                   name != null && name.isEmpty ?'The Name cannot be empty':null,
                 decoration: InputDecoration(
                       hintText: 'Product Name ',
                       hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                       border: InputBorder.none,
                       focusColor:Colors.redAccent,
                    ),
                    
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                
                  color: Colors.grey[200],
                              
             ),
          
          child: TextFormField(
            controller: priceController,
            keyboardType: TextInputType.number,
             validator: (n)=>
                 n != null && n.isEmpty ?'The Price cannot be empty':null,
            
               decoration: InputDecoration(
                     hintText: 'Product Price ',
                     hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                     border: InputBorder.none,
                     focusColor:Colors.redAccent,
                  ),
                  
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                
                  color: Colors.grey[200],
                              
             ),
          child: TextFormField(
            controller: descController,
            autofocus: true,
            
               decoration: InputDecoration(
                     hintText: 'Product Description ',
                     hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                     border: InputBorder.none,
                     focusColor:Colors.redAccent,
                  ),
                  
          ),
        ),
      ),
      SizedBox(height:20),

      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(

                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),

                      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.blueAccent,
           
            //shape:,
            onPrimary: Colors.lightBlue,
           
          ),
          onPressed:(){
            setState(() {
             
              final dbprovide = Provider.of<ProductDatabase>(context,listen: false);
              int id = Random().nextInt(1000000);
              Product product = Product(
                id: id,
                desc: descController.text, name: nameController.text,date: DateTime.now(),price: double.parse(priceController.text),  
                );
               dbprovide.insertProduct(product);
            
            
            });
           
            print("products add");
            Navigator.of(context).pop( 
            MaterialPageRoute(builder:(context)=>ProductInventory()),
          );
          },
          child: Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
        ),
                      
                    ),
      ),
      ],
      
      
    );
    
  }


  }



  
  
 



