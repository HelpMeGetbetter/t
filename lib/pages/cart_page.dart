import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';

//my imports
import 'package:flutter_auth/components/cart_products.dart';
import 'package:flutter_auth/payments/main.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModels>(context);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Shopping Cart', style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,color: Colors.red),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color:Colors.red,), onPressed: (){})
        ],
      ),

     body: new CartProducts(),

      bottomNavigationBar: new Container(
        color:  Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:",style: TextStyle(fontFamily: 'Raleway',fontSize: 20.0,fontWeight: FontWeight.normal),),
              subtitle:  new Text("\$525",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.normal),),
            ),),
            
            Expanded(child: new MaterialButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyAppp();
                  },
                ),
              );
            },
            child:  new Text("Check out", style: TextStyle(color: Colors.white),),
            color: Colors.red,),
            ),
          ],
        ),
      ),
    );
  }
}
