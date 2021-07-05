
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventory/src/view/rawinv.dart';
import 'package:inventory/src/model/rawmodel.dart';
import 'package:inventory/src/db/rawinventory.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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

  late List<RawInventory> _rawIntorys=[];




  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  late RawInvtDatabaseHelper rawdbhelper;

  final _formKey = GlobalKey<FormState>();
  late String desc;
  late String name;
  
  late double price;
  late DateTime date;
 
    save(RawInvntory _rawInvntory){

      RawInvtDatabaseHelper.instance.create(_rawInvntory);
      print ("product is succefuly created");
    }

   @override 
   void initState(){
     super.initState();

 
      
    
   }




//   refreshList(){
//     setState(() {
//       rawMaterials = rawdbhelper.listAll() as List<RawInvntory>;
//     });
//   }

  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
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
        
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 children: [
                   Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(50),
                     
                      
                    ),
                    child:Icon(Icons.add)
                    
                        
                          
                   ),
                 ],
               ),
             ),
              SizedBox(height: 15),

             
          
   
            
          
            //  Container(
            // bool img
            //     ? Container(
            //   alignment: Alignment.center,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       RaisedButton(
            //         color: Colors.greenAccent,
            //         onPressed: () {
            //           _imagePicker();
            //         },
            //         child: Text("PICK FROM GALLERY"),
            //       ),
            //       Container(
            //         height: 40.0,
            //       ),
              
                  
            //     ],
            //   ),
            // ): Container(
            //   child: Image.file(
            //     _img,
            //     fit: BoxFit.cover,
            //   ),
            // )),

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
              
                  SizedBox(height: 10,),
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
          
                SizedBox(height: 10,),
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
            name = nameController.text;
            price = priceController.text as double;
            desc = descController.text;
          });
          RawInvntory _rawIntry = RawInvntory(price: price,name: name,desc: desc,date: DateTime.now());
          save(_rawIntry);
          Navigator.of(context).pop();
        },
        child: Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
      ),
                    
                  ),
              
              );
  }
 Future addProduct ()async {
    final product = RawInvntory(
      
     
      date: DateTime.now(),
       price: price,
      name :name,  
      desc: desc, );
      
    await RawInvtDatabaseHelper.instance.create(product);
  }

   addOrUpdate() async{
    final isValid = _formKey.currentState!.validate();


    if (isValid) {
      final isUpdating =  widget.rawInvntory != null;

      if (isUpdating) {
        await updateProduct();
      } else {
        await addProduct();
      }
       
       print("http://localhost:59664/dart_sdk.js:157805:11");

    
      Navigator.of(context).pop();
  
    }
  
  }
Future updateProduct()async {
    final product = RawInvntory(
      name: name,
      price: price,
      desc: desc,
      date:date,
    );
    await RawInvtDatabaseHelper.instance.update(product);

  }



}