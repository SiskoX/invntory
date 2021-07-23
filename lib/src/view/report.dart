
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inventory/src/db/moorProductdb.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/model/rawmodel.dart';
import 'package:inventory/src/view/dashboard.dart';
 
import 'package:inventory/src/model/productmodel.dart';
import 'package:inventory/src/db/moorRaw.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Report extends StatefulWidget{
 
 _ReportState createState()=> _ReportState();
}

class _ReportState extends State<Report>{
  
  List<RawMaterials> _rawMaterials = <RawMaterials>[];
 late TooltipBehavior _tooltipBehavior;

 @override
 void initState(){
   _tooltipBehavior = TooltipBehavior(enable: true);
 }
  @override 
  Widget build(BuildContext context){
    return Scaffold( 
      body: ListView(children: [
        Column(children: [
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
              child: Text("Report",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
            ),

          ],),
          Column(children: [
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  
                  ),
                  child: Center(child: Text("Product Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
                    _build(context),
         
        Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  
                  ),
                  child: Center(child: Text("Raw Material Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
                  _buildTaskList(context)
      
    
          ],)
        ],)
      ],),
    );
  }
  StreamBuilder<List<RawMaterial>>_buildTaskList(BuildContext context) {
     final db = Provider.of<RawMaterialsDatabase>(context);
   
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
                child:  SfCircularChart(
                        legend: Legend(isVisible:true, overflowMode: LegendItemOverflowMode.wrap),
                       
                      series: <CircularSeries>[
                       DoughnutSeries<RawMaterial,String>(
                          dataSource: rawMaterials,
                          xValueMapper: (RawMaterial data,_)=> data.name,
                          yValueMapper: (RawMaterial data,_)=> data.price,
                       
                       
                          dataLabelSettings: DataLabelSettings(isVisible: true,color: Colors.white),
                        ),
                      ],
                
                )
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

  StreamBuilder<List<Product >>_build(BuildContext context) {
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
                child:  SfCircularChart(
                    legend: Legend(isVisible:true, overflowMode: LegendItemOverflowMode.wrap),
                     
                      series: <CircularSeries>[
                        DoughnutSeries<Product,String>(
                          dataSource: products,
                          xValueMapper: (Product data,_)=> data.name,
                          yValueMapper: (Product data,_)=> data.price,
                       
                        dataLabelSettings: DataLabelSettings(isVisible: true,color: Colors.white ),
                          //dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                
                )
            ));
                
          }

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
