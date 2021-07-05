import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/src/model/rawmodel.dart';
import 'package:inventory/src/view/rawmaterialadd.dart';
import 'package:inventory/src/view/dashboard.dart';
import 'package:inventory/src/db/rawinventory.dart';

import 'package:google_fonts/google_fonts.dart';

class RawInventory extends StatefulWidget{

  @override 

  _RawInventory createState()=>_RawInventory();

}

class _RawInventory extends State<RawInventory>{

  
  late List<RawInvntory> rawInvtory;
  bool isLoading =false;
  
  @override
  void initState(){
    super.initState();

    refreshRawM();

  } 

  // @override
  // void dispose() {
  //   RawInvtDatabaseHelper.instance.close();

  //   super.dispose();
  // }


   Future refreshRawM()async{
    setState(() => isLoading = true);
    
    this.rawInvtory = await RawInvtDatabaseHelper.instance.listAll();
  
    setState(() => isLoading = false);
    
    
  }
  @override
 Widget build(BuildContext context){
    return Scaffold(

      body: Column(
        children: [
          Row(
            
            children: [
              SizedBox(height: 20,),
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
              child: Text("Raw Inventory",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
            )
          ],),

          Center(
            child: isLoading
            ? CircularProgressIndicator()
            : rawInvtory.isEmpty
              ? Text(
                 'No Product',style:TextStyle(color:Colors.black12,fontSize: 40)
              )
              :tableView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: ()async{
          await Navigator.of(context).push( 
            MaterialPageRoute(builder:(context)=>RawMaterialAdd()),
          );
          refreshRawM();
        },
      ),

    );
  }

    
   tableView() {
  
  return DataTable(

    columns: [
      DataColumn(
        label: Text("Name",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),


        ),
      DataColumn(
          label: Text("Price",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
      DataColumn(
          label: Text("Date",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
        
    ], 
    rows: rawInvtory
    .map((e) 
    =>DataRow(cells: [
      DataCell(
        Text(e.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
      ),
      DataCell(
        Text(e.price.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
      ),
      ),
       DataCell(
        Text(e.date.toString(),style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
      ),
      ),

    ])
    ).toList()
      
    );

}


    
            
  }
// Widget saveButton(){
  

//  return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           onPrimary: Colors.white,
          
//         ),
//         onPressed: addOrUpdate,
//         child: Text('Save'),
        
//       ),
//     );






  
// Future _updateDb ()async{
//   final rawInvntory = RawInvntory(
//        name: nameController.text,
//       price: priceController.text as double,
//       desc: descController.text, 
//       date: DateTime.now(),
//       );
//       await RawInvtDatabaseHelper.instance.update(rawInvntory);

// Future  _addToDb() async {
//     final rawInventory = RawInvntory(

//       name: nameController.text,
//       price: priceController.text as double,
//       desc: descController.text, 
//       date: DateTime.now(),
//       );

    
//     await RawInvtDatabaseHelper.instance.create(rawInventory );
    
//   }

  






