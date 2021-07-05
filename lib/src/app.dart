import 'package:flutter/material.dart';
import 'view/rawinv.dart';
import 'view/dashboard.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inventory",
      debugShowCheckedModeBanner: false,
      home:Dashboard(),
      
    );
  }
}