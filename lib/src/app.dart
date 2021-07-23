

import 'package:flutter/material.dart';
import 'view/rawinv.dart';
import 'package:provider/provider.dart';
import 'view/dashboard.dart';
import 'package:inventory/src/db/moorProductdb.dart';
import 'package:inventory/src/db/moorCust.dart';
import 'package:inventory/src/db/moorRaw.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
     return MultiProvider(
      providers: [
        Provider <ProductDatabase>(create: (_)=>ProductDatabase(),),
        Provider <CustomerDatabase>(create: (context)=>CustomerDatabase(),),
        Provider <RawMaterialsDatabase>(create: (_)=>RawMaterialsDatabase(),),
        
      ],
      
      child: MaterialApp(
      
          
          title: "Inventory",
          debugShowCheckedModeBanner: false,
          home:Dashboard(),
          
      
      ),
    );
  }
}