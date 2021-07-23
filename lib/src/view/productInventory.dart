

import 'package:provider/provider.dart';
import 'package:inventory/src/db/moorProductdb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:inventory/src/view/dashboard.dart';

import 'package:image_picker/image_picker.dart';


import 'package:inventory/src/view/productadd.dart';


class ProductInventory extends StatefulWidget{
  


 
 _ProductInventory createState()=> _ProductInventory();
}

class _ProductInventory  extends State<ProductInventory>{
late Product product;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
       body: ListView(
         children:[ Column(
            children: <Widget>[
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
                  
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Product Inventory",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
                  )
                ],),
              ),
             _buildTaskList(context),
         
             
            ],
            
          ),
         ]),
         floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed:() {

             Navigator.of(context).push( 
            MaterialPageRoute(builder:(context)=>ProductAdd()),
          );
          
        }
          
 
      )
        );
    
  }

  StreamBuilder<List<Product >>_buildTaskList(BuildContext context) {
    final database = Provider.of<ProductDatabase>(context);
     return StreamBuilder(
       
      stream: database.watchallProducts(),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        final products = snapshot.data ?? [];
        if (snapshot.hasError) {
              return Text("Error");
            }
       if (snapshot.data == null || snapshot.data!.length == 0) {
              return Column(
                children: <Widget>[
                  Center(child: Text("NO PRODUCT",style: GoogleFonts.lato(textStyle: TextStyle(color:Colors.grey[300],fontSize: 50,fontWeight: FontWeight.w900))
                  ))],
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
                                onTap: ()=>database.deleteProduct(e),
                                child: Icon(Icons.delete))
                            )
                          ])).toList()
                                        ),
            ));
                
          }
        // return ListView.builder(
        //  // scrollDirection: Axis.vertical,
        //       shrinkWrap: true,
        //       itemCount: products.length,
        //       itemBuilder: (_, index) {
        //         final product = products[index];
        //         return Container(
        //           height: 30,
                 
        //           // child: ListTile(
        //           //   title: Text(products[index].name),
        //           //   subtitle: Text(products[index].date.toString()),
        //           // ),
        //         );
         
        //   },
        // );
         if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        return Text('No Data');
      },
    );

  }

  

  
}