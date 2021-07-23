
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/view/customer.dart';
import 'package:inventory/src/db/moorCust.dart';
import 'package:moor/moor.dart'hide Column;
import 'package:provider/provider.dart';

class AddCustomerPage extends StatefulWidget{
  @override 
  _AddCustomerPage createState()=> _AddCustomerPage();

}

class _AddCustomerPage extends State<AddCustomerPage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController tinnumController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController locController = TextEditingController();

  late String name;
  late int phone;
  late String loc;
  late int tinnum;


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
         
                InkWell(
                  onTap: ()=>{
                     Navigator.pop(context,MaterialPageRoute(builder:(context)=>CustomerInfo()))
                   },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ))
            ],),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Add Customer Info ",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
                )
                         ],),
             ),
             addProduct()
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
                       hintText: ' Name ',
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
            controller: phonenumController,
            keyboardType: TextInputType.number,
             validator: (n)=>
                 n != null && n.isEmpty ?'The Price cannot be empty':null,
            
               decoration: InputDecoration(
                     hintText: 'Phone Number ',
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
            controller: tinnumController,
            keyboardType: TextInputType.number,
             validator: (n)=>
                 n != null && n.isEmpty ?'The tin cannot be empty':null,
            
               decoration: InputDecoration(
                     hintText: 'TIN Number ',
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
            controller: locController,
            autofocus: true,
            
               decoration: InputDecoration(
                     hintText: 'Location',
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
             
              final dbprovide = Provider.of<CustomerDatabase>(context,listen: false);
              int id = Random().nextInt(1000000);
              Customer customer = Customer(
                id: id, location: locController.text, name: nameController.text,phone: int.parse(phonenumController.text),tinnumber:int.parse( tinnumController.text)
  
                
                );
               dbprovide.insertProduct(customer);
            
            
            });
           
            print("products add");
            Navigator.of(context).pop( 
            MaterialPageRoute(builder:(context)=>CustomerInfo()),
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