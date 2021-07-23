import 'package:flutter/material.dart';
import 'package:inventory/src/db/moorRaw.dart';
import 'package:inventory/src/db/moorProductdb.dart';
import 'package:inventory/src/view/productInventory.dart';
import 'package:inventory/src/view/rawinv.dart';
import 'package:inventory/src/view/report.dart';
import 'package:inventory/src/view/customer.dart';


import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class Dashboard extends StatefulWidget{

  _DashboardState createState()=> _DashboardState();

}

class _DashboardState extends State<Dashboard>{

 @override 
 void initState(){
   super.initState();
  
 }
late List <RawMaterial> rawMaterial;


  @override 
  Widget build(BuildContext context){
    return  Scaffold(
    
        body: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 103),
                 
                    child: Column(
                  
                      
                      children: [
                  
  
                               SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,
                                 child: Row(
                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                             children: [
                                                             
                                              
                                   InkWell(
                                                             onTap: ()=>{
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>RawInventory()))
                                                             },
                                                             child: Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration( 
                                    
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                                       
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("Raw Material Inventory",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                                                             ),
                                                       ),
                                 InkWell(
                                                             onTap: ()=>{
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CustomerInfo()))
                                                             },
                                                             child: Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration( 
                                    
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                                       
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("Customer Info",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Railway',),)),
                                                             ),
                                                       ),
                                                             InkWell(
                                                             onTap: ()=>{
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductInventory()))
                                                             },
                                                             child: Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration( 
                                    
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                                       
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("Product Inventory",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Railway',),)),
                                                             ),
                                                       ),
                                                             InkWell(
                                                             onTap: ()=>{
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Report()))
                                                             },
                                                             child: Container(
                                  width: 300,
                                  height: 100,
                                  decoration: BoxDecoration( 
                                    
                                    color: Colors.blueAccent,
                                    border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                                       
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("Report",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Railway',),)),
                                                             ),
                                                       ),
                                          
                                                             ],
                                                       ),
                               ),
                           
                             
                            
                           
                         
                        
                      
                     
                      ],
                    ),
                  ),
                ),
                // Container(
                  
                //   height: 100,
                //   child: searchView(),
                //   ),

                  SizedBox(height: 20,),
            
                  
                  
                
                   
                   
                  
            ],
            
          ),
        
             
             
           
         
        
    );
    
    
  }
   
  // gridViw (){
  //   Container(
  //     child:new StaggeredGridView.countBuilder(
  //       crossAxisCount: 4, 
  //       itemBuilder:(context,index){

  //       }, 
  //       staggeredTileBuilder: staggeredTileBuilder)
  //   );
  // }
  
  searchView(){

  return   Container(
  

    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                
                
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
                          suffixIcon: Icon(Icons.search,color: Colors.redAccent,) ,
                          hintText: 'Search Product ...',
                          hintStyle:TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),

                          border: InputBorder.none,
                          
                          
                          focusColor:Colors.redAccent,
                          
                      
                          
                        ),
                       onChanged: (String text)async{
                        //  List<Map> res = await db.rawQuery(
                        //                 "SELECT * FROM sentences WHERE title LIKE '%${text}%' OR  body LIKE '%${text}%'");
                        //             print(res);
                       },
                        cursorWidth: 10,
                        cursorHeight: 10,
                        cursorRadius: Radius.circular(10),
                        cursorColor: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                    
  
                  ],
    ),
    
  );           
              
}

  
}

 