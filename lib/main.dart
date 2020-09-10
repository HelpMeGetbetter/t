import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/pages/cart_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/pages/product_details.dart';
import 'package:provider/provider.dart';

import 'Model/cart_model.dart';
import 'Model/products.dart';


void main(){
  runApp(
      MyApp());
}




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>.value(value:Products()),
        ChangeNotifierProvider<CartModels>.value(value:CartModels()),
       // ChangeNotifierProvider<Product>.value(value:Product()),
       // ChangeNotifierProvider<CartModel>.value(value:CartModel()),
      ],
      child: new MaterialApp(
          home: new HomePage(),

        routes: {
      ProductDetails.routeName: (ctx) => ProductDetails(),
      CartPage.routeName: (ctx) => CartPage(),
      },),
    );
  }
}
