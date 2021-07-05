import 'package:flutter/material.dart';
import 'package:inventory/src/model/productmodel.dart';
import 'package:inventory/src/db/db.dart';
import 'package:inventory/src/view/productaddedit.dart';

class ProductDetailPage extends StatefulWidget{
final int productID;
const ProductDetailPage({
    Key? key,
    required this.productID,
  }) :super(key: key);
  _ProductDetailPageState createState()=> _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>{
  late Product product;
 bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshProduct();
  }
  Future refreshProduct() async {
    setState(() => isLoading = true);

    this.product = await ProductDatabase.instance.readProduct(widget.productID);

    setState(() => isLoading = false);
  }

  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                   
                    SizedBox(height: 8),
                    Text(
                      product.description,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ),

    );
  }

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductAddPage(product: product),
        ));

        refreshProduct();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await ProductDatabase.instance.delete(widget.productID);

          Navigator.of(context).pop();
        },
      );
  
}