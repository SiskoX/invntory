import 'package:flutter/material.dart';

import 'package:inventory/src/model/productmodel.dart';


class ProductCardWidget extends StatelessWidget{
  ProductCardWidget({
    Key ? key,
    required this.product,
    required this.index,
  }):super(key:key);
  
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context){
    return Card(
      child: Container(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 4),
            Text(
              product.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}