import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inventory/src/view/rawmaterialadd.dart';
import 'package:inventory/src/view/dashboard.dart';
import 'package:inventory/src/db/moorRaw.dart';



import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class RawInventory extends StatefulWidget{

  @override 

  _RawInventory createState()=>_RawInventory();

}

class _RawInventory extends State<RawInventory>{

  

  
  @override
  void initState(){
    super.initState();

    // refreshRawM();

  } 



  @override
 Widget build(BuildContext context){
    return Scaffold(

      body: ListView(
        children:[ Column(
          children: [
            Row(
              
              children: [
          
                InkWell(
                  onTap: ()=>{
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>Dashboard()))
                   },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back_ios),
                  ))
            ],),
             Row(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Raw Inventory",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
              )
            ],),
      
           _buildTaskList(context),
          ],
        ),
         ] ),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: ()async{
          await Navigator.of(context).push( 
            MaterialPageRoute(builder:(context)=>RawMaterialAdd()),
          );
          // refreshRawM();
        },
      ),

    );
  }

    
  

StreamBuilder<List<RawMaterial>>_buildTaskList(BuildContext context) {
     final db = Provider.of<RawMaterialsDatabase>(context,listen:true);
   
     return StreamBuilder(
       stream: db.watchallProducts(),
       builder: (context, AsyncSnapshot<List<RawMaterial>> snapshot){
         final rawMaterials = snapshot.data ?? [];

         if (snapshot.hasError) {
              return Text("Error");
            }
         if (snapshot.data == null || snapshot.data!.length == 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                  
                    Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("NO RAW MATERIALS",style: GoogleFonts.lato(textStyle: TextStyle(color:Colors.grey[300],fontSize: 50,fontWeight: FontWeight.w900)),),
                    ))
                  ],
                ),
              );
            }  
           if (snapshot.hasData){

            return  SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [ 
                     DataColumn(
                        label: Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                        ),
                      DataColumn(
                          label: Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                      DataColumn(
                          label: Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          DataColumn(
                          label: Text("Delete",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                     
                     
                        
                  ], 
                  rows: snapshot.data!
                  .map((e) 

                  =>DataRow(cells: [
                            DataCell(
                              Text(e.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
                            ),
                            
                            DataCell(
                              Text(e.price.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                            ),
                            ),
                            DataCell(
                              Text(e.date.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                            ),
                            
                            ),
                            DataCell(
                              InkWell(
                                onTap: ()=>db.deleteProduct(e),
                                child: Icon(Icons.delete))
                            )
                            
                          ])).toList()
                                        ),
            ));
                
          }
          if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
           return Text('No Data');

       }

       );

  }

    
            
  }







  






