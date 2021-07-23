

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory/src/view/rawinv.dart';
import 'package:inventory/src/model/rawmodel.dart';
import 'package:inventory/src/db/moorRaw.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RawMaterialAdd extends StatefulWidget{
final RawInvntory? rawInvntory;

 const RawMaterialAdd({
    Key? key,
    this.rawInvntory,
  }) : super(key: key);
  @override
  _RawMaterialAdd createState()=> _RawMaterialAdd();

}

class _RawMaterialAdd extends State<RawMaterialAdd>{
  
 
  final picker = ImagePicker();




  TextEditingController nameController =  TextEditingController();
  TextEditingController priceController =  TextEditingController();
  TextEditingController descController =  TextEditingController();

  // late RawInvtDatabaseHelper rawdbhelper;

  final _formKey = GlobalKey<FormState>();
  late String desc;
  late String name;
  
  late double price;
  late DateTime date;
 
    // save(RawInvntory _rawInvntory){

    //   RawInvtDatabaseHelper.instance.create(_rawInvntory);
    //   print ("product is succefuly created");
    // }

   



  Widget build (BuildContext context){
    return Scaffold(
      body: ListView(
        children:[ Container(
        child:  Column(
          children: [
            Row(
              children: [
               
             InkWell(
               onTap: ()=>{
                 
                                         Navigator.pop(
                                           context,
                                           MaterialPageRoute(builder: (context)=>RawInventory(),)
                                         )
               },
               child: Container(
                 
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Icon(Icons.arrow_back_ios,),
                 )),
                 
             ),
            
              
              
              ],),
              Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(children:[ Text("Add Raw Material",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w900)), )]),
              )
            ],),
           
                SizedBox(height: 15),
      
               
            
         
              
            
          
      
            SizedBox(height: 10,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
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
                                    
                               controller: nameController,
                                cursorWidth: 10,
                                cursorHeight: 10,
                                cursorRadius: Radius.circular(10),
                                cursorColor: Colors.redAccent,
                              ),
                            ),
                          ),
                   ),
                        
            
                   ),
                
                   
                  Container(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
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
                              hintText: 'Product Price ',
                              hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                              border: InputBorder.none,
                              
                              
                              
                              focusColor:Colors.redAccent,
                              
                           
                              
                            ),
                             keyboardType: TextInputType.number,
                   
                            validator: (n)=>
                                n != null && n.isEmpty ?'The Price cannot be empty':null,
                                // controller: priceController,
                            controller: priceController,
                            cursorWidth: 10,
                            cursorHeight: 10,
                            cursorRadius: Radius.circular(10),
                            cursorColor: Colors.redAccent,
                          ),
                        ),
                      ),
               ),),
            
                 
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
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
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                              border: InputBorder.none,
                              
                              
                              
                              focusColor:Colors.redAccent,
                              
                           
                              
                            ),
                            // validator: (n)=>
                            //     n!= null && n.isEmpty ?'The D cannot be empty':null,
                           controller: descController,
                            cursorWidth: 10,
                            cursorHeight: 10,
                            cursorRadius: Radius.circular(10),
                            cursorColor: Colors.redAccent,
                          ),
                        ),
                      ),
                      
                      ),
                    ),
            
                     saveButton(),
                    ],
                   
                    
              ),
            ) ],
      
      
          
        ),
        
        ),
        ]),
    );
  }

  
 saveButton(){
    
     return Padding(
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
         final dbprovide = Provider.of<RawMaterialsDatabase>(context,listen: false);
              int id = Random().nextInt(1000000);
              RawMaterial product = RawMaterial(
                id: id,
                desc: descController.text, name: nameController.text,date: DateTime.now(),price: double.parse(priceController.text),  
                );
               dbprovide.insertProduct(product);
          });
         


        
          // save(_rawIntry);
          Navigator.of(context).pop();
        },
        child: Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
      ),
                    
                  ),
              
              );
  }
 



}