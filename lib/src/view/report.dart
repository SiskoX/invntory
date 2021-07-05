import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:inventory/src/view/dashboard.dart';
class Report extends StatefulWidget{
 
 _ReportState createState()=> _ReportState();
}

class _ReportState extends State<Report>{

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
            )
          ],)
        ],)
      ],),
    );
  }
}