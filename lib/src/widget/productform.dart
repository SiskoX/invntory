import 'package:flutter/material.dart';
import 'dart:async';
import 'package:inventory/src/model/productmodel.dart';
import 'package:inventory/src/utility/utility.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ProductFormWidget extends StatelessWidget{

  final String? name;
  final String? imagePath;
  final String? description;
  final double? price ;
  final ValueChanged <String> onChangedName;
  final ValueChanged <String> onChangedImage;
  final ValueChanged <String> onChangedDescrption;
  final ValueChanged <double> onChangedPrice;

  const ProductFormWidget({
    Key? key,
    this.name = '',
    this.price = 0.0,
    this.description='',
    this.imagePath='',

    required this.onChangedDescrption,
    required this.onChangedImage,
    required this.onChangedName,
    required this.onChangedPrice,
    
  
  }):super(key: key);
  @override 
  Widget build (BuildContext context) {
  return Container(

    
   
                height: 800,
                color: Colors.white,
                child: Center(
                child:Column(
            children:[
              Divider(height: 20,thickness: 2,indent: 400,endIndent: 400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               
                   new Flexible(
                    child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 50,
                      height: 50,

                      child: Icon(Icons.camera_alt,color: Colors.grey,),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(70) ,
                        color: Colors.grey[200]

                      ),),
                  ),
        
              ),
                
              
                  

                ],
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Flexible(child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                      decoration: InputDecoration(
                        hintText: 'Product Name ',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        
                        
                        focusColor:Colors.redAccent,
                        
                     
                        
                      ),
                      validator: (name)=>
                          name != null && name.isEmpty ?'The Name cannot be empty':null,
                          onChanged: onChangedName,
                     
                      cursorWidth: 10,
                      cursorHeight: 10,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                ),
              ),),
                 

              ],),
            
                     
             
              
              
                    Padding(
                padding: const EdgeInsets.all(10.0),
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
                      decoration: InputDecoration(
                        hintText: 'Price',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        focusColor:Colors.redAccent,
                        
                        
                        
                      ),
                       keyboardType: TextInputType.number,
                       validator:(price)=>
                        price != null && price.isEmpty ?'The Price cannot be empty':null,
                        // onSaved: (val)=>setState(()=>),
                        onChanged: (price)=>onChangedPrice(price as double),
                        
                     
                      cursorWidth: 10,
                      cursorHeight: 10,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                ),
              ),

              Row(
                children: [

                  new Flexible(child: 
                      Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    color: Colors.grey[200],
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        focusColor:Colors.redAccent,
                        
                    
                        
                      ),
                    validator: (name)=> name != null && name.isEmpty ? 'The descriptiion cannot be empty':null,
                    onChanged: onChangedDescrption,
          
                     
                      cursorWidth: 10,
                      cursorHeight: 10,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                ),
              ),)
                ],
              ),

            
              

            ]
          )
                ),
              );
  
  }

}