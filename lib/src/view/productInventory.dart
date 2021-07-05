


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/db/db.dart';
import 'package:inventory/src/view/productaddedit.dart';
import 'package:inventory/src/view/dashboard.dart';
import 'package:inventory/src/model/productmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/src/view/productaddedit.dart';
import 'package:inventory/src/view/produtctDetail.dart';
import 'package:inventory/src/widget/productform.dart';
import 'package:inventory/src/widget/productcard.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductInventory extends StatefulWidget{
  


 
 _ProductInventory createState()=> _ProductInventory();
}

class _ProductInventory extends State<ProductInventory>{

late List<Product> products;
  bool isLoading = false;

 @override 
 void initState(){
   super.initState();

   refreshProducts();
 }
@override
void dispose(){
  ProductDatabase.instance.close();

  super.dispose();
}

Future refreshProducts ()async{
  setState(()=>isLoading = true );

  this.products = await ProductDatabase.instance.readAllProduct();

  setState(()=>isLoading = false);
}

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
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
              child: Text("Product Inventory",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)), ),
            )
          ],),
             Center(
          child: isLoading
              ? CircularProgressIndicator()
              : products.isEmpty
                  ?  Text( 'No Product',style:TextStyle(color:Colors.black12,fontSize: 40),
                  ): buildProduct(),
        )
         
        // DataTable(
        //   columns: columns, 
        //   rows: rows,
        //   )
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed:()async{
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>ProductAddPage())
          );
          refreshProducts();
        }
          
 
      )
    );
    
  }
    Widget buildProduct() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailPage(productID: product.id!),
              ));

              refreshProducts();
            },
            child: ProductCardWidget(product: product, index: index),
          );
        },
      );
 
  }

 






