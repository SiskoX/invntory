
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory/src/view/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerInfo extends StatefulWidget{

  @override 

  _CustomerInfoState createState()=>  _CustomerInfoState();

}

class _CustomerInfoState extends State<CustomerInfo>{

  @override 
  Widget build(BuildContext context){

    return Scaffold(
      body:  Container(
        
       
       child: Column(
         
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()=>{
                   Navigator.pop(context,MaterialPageRoute(builder:(context)=>Dashboard()))
                 },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_back_ios),
                ))
          ],),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Customer Info",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
            )
          ],)
        
        ],)
      ),
          floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed:(){
          showModalBottomSheet<void>(
            
            shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(50.0),
     
  ),
  backgroundColor: Colors.transparent,
            //shape:  ,
            context: context,
            
            builder: (BuildContext context) {
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
                    // child: Container(
                    //   width: 50,
                    //   height: 50,

                    //   child: Icon(Icons.camera_alt,color: Colors.grey,),
                    //   decoration: BoxDecoration(
                    //     borderRadius:BorderRadius.circular(70) ,
                    //     color: Colors.grey[200]

                    //   ),),
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Customers Name ',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        
                        focusColor:Colors.redAccent,
                        
                    
                        
                      ),
                     
                      cursorWidth: 10,
                      cursorHeight: 10,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                ),
              ),),
                 

              ],),
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number ',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        
                        focusColor:Colors.redAccent,
                        
                    
                        
                      ),
                     
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Location',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        focusColor:Colors.redAccent,
                        
                    
                        
                      ),
                     
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
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    color: Colors.grey[200],
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Tin Number',
                        hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),
                        border: InputBorder.none,
                        
                        focusColor:Colors.redAccent,
                        
                    
                        
                      ),
                     
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

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(child: Text("Approve",style: TextStyle(color: Colors.white,fontFamily:'Railway',fontSize: 20,fontWeight: FontWeight.bold),)),
                  
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                  ),
                ),
              )

            ]
          )
                ),
              );
            }
  );
        }
      )
    );
  }
  
}