import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:provider/provider.dart';


class ProductsPage extends StatefulWidget   {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final productList=productData.items;
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            product: Product(name: productList[index].name,
              id: productList[index].id,
              picture: productList[index].picture,
              oldPrice: productList[index].oldPrice,
              price: productList[index].price,)
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final product;
  SingleProd({
    this.product
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product.name, child: Material(
        child: InkWell(onTap: ()=> Navigator.pushNamed(
          context,
          ProductDetails.routeName,
          arguments: ProductDetailsArguments(product: product)
        ),
          child: GridTile(
              footer: Container(color: Colors.white70,
                child: ListTile(
                  leading: Text(product.name, style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,),
                  ),
                  title: Text("\$${product.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle:  Text("\$${product.oldPrice}", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration:TextDecoration.lineThrough,
                  ),
                  ),
                ),
              ),
              child: Image.asset(product.picture,
                fit: BoxFit.cover,)),
        ),
      )
      )
    );
  }
}