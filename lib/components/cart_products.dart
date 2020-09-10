
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  final sum;
  const CartProducts({Key key,  this.sum}) : super(key: key);
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [

    ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModels>(context);

    final productList=cart.items;
    if (productList.isEmpty){
      return Center(child: Text("Cart is Empty"));
    } else
    return
      new ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index){
        return SingleCartProduct(
            cartModel: CartModel(name: productList[index].name,
              id: productList[index].id,
              picture: productList[index].picture,
              oldPrice: productList[index].oldPrice,
              price: productList[index].price, quantity: productList[index].quantity,)
        );
      });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartModel;


  SingleCartProduct({
this.cartModel});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:  new Image.asset(cartModel.picture),
        title: new Text(cartModel.name,),
        subtitle: new Column(
          children: <Widget>[
           // Row inside column
            new Row(
              children: <Widget>[
                // this section is for the size of the product
                Expanded(child: new Text("",),),
               Padding(
                   padding: const EdgeInsets.all(6.0),
               child: new Text("",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 17,)),
               ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text('l', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 24.0), ),
                ),
          ],
        ),
            new Container(child: new Text(""),
            ),
            //
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$${cartModel.price}", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.red),),
            ),
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$${cartModel.oldPrice}", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.black38,decoration: TextDecoration.lineThrough),),
            ),

    ],
      ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
