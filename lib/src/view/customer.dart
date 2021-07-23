

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory/src/view/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/model/customer.dart';
import 'package:inventory/src/db/customerrinfo.dart';
import 'package:provider/provider.dart';
import 'package:inventory/src/db/moorCust.dart';
import 'package:inventory/src/view/addcustomer.dart';


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
          ],),
            _buildTaskList(context),
        
        ],)
      ),
      
      
          floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed:(){
            Navigator.of(context).push( 
            MaterialPageRoute(builder:(context)=>AddCustomerPage()
            ));
        }
      )
    );
  }
  

   StreamBuilder<List<Customer >>_buildTaskList(BuildContext context) {
     final db = Provider.of<CustomerDatabase>(context,listen: true);

     return StreamBuilder(
       stream: db.watchallCustomers(),
       builder: (context, AsyncSnapshot<List<Customer>> snapshot){
         final customers = snapshot.data ?? [];

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
                      child: Text("NO CUSTOMER",style: GoogleFonts.lato(textStyle: TextStyle(color:Colors.grey[300],fontSize: 50,fontWeight: FontWeight.w900)),),
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
                          label: Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                      DataColumn(
                          label: Text("Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                      DataColumn(
                          label: Text("Tin Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                              Text(e.phone.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                            ),
                            ),
                            DataCell(
                              Text(e.location.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                            ),
                            
                            ),
                             DataCell(
                              Text(e.tinnumber.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10)
                            )),
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