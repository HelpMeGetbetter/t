import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/components/horizontal_listview.dart';
import 'package:flutter_auth/components/product_item.dart';
import 'package:flutter_auth/login_Signup/Screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';


import 'cart_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 6.0,
      ),
    );

    return  Scaffold(
            appBar: new AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              title: Text('AppStore',
                  style: TextStyle(fontFamily: 'Raleway')),
              actions: <Widget>[
                new IconButton(icon: Icon(Icons.search, color:Colors.white,), onPressed: (){})
                ,new IconButton(icon: Icon(Icons.shopping_cart, color:Colors.white,), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> new CartPage()));
                })
              ],
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
//            header
                  new UserAccountsDrawerHeader(accountName: Text('Santos Enoque'), accountEmail: Text('santosenoque.ss@gmail.com'),
                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white,),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        color: Colors.red
                    ),
                  ),

//          body

                  InkWell(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );},
                    child: ListTile(
                      title: Text('LogOut'),
                      leading: Icon(Icons.person, color: Colors.red),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('My Orders'),
                      leading: Icon(Icons.shopping_basket, color: Colors.red),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> new CartPage()));
                    },
                    child: ListTile(
                      title: Text('Shopping Cart'),
                      leading: Icon(Icons.shopping_cart, color: Colors.red),
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Favourites'),
                      leading: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ),

                  Divider(),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                        title: Text('Settings'),
                        leading: Icon(Icons.settings)
                    ),
                  ),

                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('About'),
                      leading: Icon(Icons.help,),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('More info'),
                      leading: Icon(Icons.info,),
                    ),
                  )

                ],
              ),
            ),

            body: new ListView(
              children: <Widget>[

                //image carousel begins here
                imageCarousel,

                //Padding widget
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: new Text('Categories',
                    style: TextStyle(fontFamily: 'DancingScript',fontWeight: FontWeight.w900,fontSize: 25,),
                    textAlign: TextAlign.center,),),

                //Horizontal list view begins here
                HorizontalList(),

                //Padding widget
                new Padding(padding: const EdgeInsets.all(17.0),
                  child: new Text('Recent products',
                    style: TextStyle(fontFamily: 'DancingScript',fontSize: 25,fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,),
                ),

//grid view
                Container(
                  height: 320.0,
                  child: ProductsPage(),
                )
              ],
            ),
    );
  }
}