import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/cart_model.dart';
import 'package:flutter_auth/Model/products.dart';
import 'package:flutter_auth/pages/cart_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:provider/provider.dart';


class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments ({@required this.product,});
}
class ProductDetails extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args = ModalRoute.of(context).settings.arguments;
    final cartModels = Provider.of<CartModels>(context);
    final products = Provider.of<Products>(context);
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: (
             InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
              child: Text('AppStore',
              ))
          ),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color:Colors.white,), onPressed: (){}),
            new IconButton(icon: Icon(Icons.shopping_cart, color:Colors.white,), onPressed: (){Navigator.pushNamed(
                context,
                CartPage.routeName);},)
          ],
        ),

      body: new ListView(
        children: <Widget>[
         new Container(
           height: 300.0,
           child: GridTile(
               child: Container(
                 color: Colors.white,
                 child: Image.asset(args.product.picture),
               ),
               footer: new Container(
                 color: Colors.white70,
                 child: ListTile(
                   leading:  new Text(args.product.name,
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                   title:  new Row(
                     children: <Widget>[
                        Expanded(
                         child: new Text("\$${args.product.oldPrice}",
                         style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),),
                   ),
                       Expanded(
                         child: new Text("\$${args.product.price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),),
                       )
               ],
           ),
           ),
         ),
    ),
      ),

//      ========= The first button ==========

      Row(
        children: <Widget>[

//       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
    showDialog(context: context,
    builder: (context){
      return new AlertDialog(
        title: new Text("Size"),
        content: new Text("Choose the size"),
        actions: <Widget>[
          new MaterialButton(onPressed: (){
            Navigator.of(context).pop(context);
          },
          child: new Text("close"),)
        ],
      );
    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                  child:  new Text("Size")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),

          //       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Colors"),
                        content: new Text("Choose a Color",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 13,)),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("close"),)
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:  new Text("Color")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),

          //       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the Quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("close"),)
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:  new Text("Qty")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


//      ========= The Second button ==========

          Row(
            children: <Widget>[

//       ========= the size button =======
              Expanded(
                child: MaterialButton(onPressed: (){
                  cartModels.addItem(args.product);
                },
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Add to Cart"),
                ),
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){}),

              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red, onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 20,)),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(args.product.name),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,)),),
              // product brand
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),)
            ],
          ),


// ----PRODUCT CONDITION------
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),)
            ],
          ),

          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),
          child: new Text("Similar products"),
          ),

          // Similar product section
          Container(
            height: 360.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final productList=productData.similarItems;
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProd(
                product: Product(name:productList[index].name,
                id: productList[index].id,
                picture: productList[index].picture,
                oldPrice: productList[index].oldPrice,
                price: productList[index].price,)
          );
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
 final product;

  SimilarSingleProd({
    this.product
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product.name, child: Material(
        child: InkWell(onTap: ()=> Navigator.of(context).push( new MaterialPageRoute(builder:(context) => new ProductDetails(
        
        ))),
          child: GridTile(
              footer: Container(color: Colors.white70,
                child: ListTile(
                  leading: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold),
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
      )),
    );
  }
}




