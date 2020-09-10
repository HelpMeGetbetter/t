import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String name;
  final double price;
  final String id;
  final String picture;
  final double oldPrice;

  Product({@required this.picture, @required this.oldPrice, @required this.name, @required this.price, @required this.id});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: "1",
      name: "Shirts",
      picture: "images/products/blazer1.jpeg",
      oldPrice: 120,
      price: 85,
    ),
    Product(
      id: "2",
      name: "tshirts",
      picture: "images/products/blazer2.jpeg",
      oldPrice: 110,
      price: 75,
  ),
    Product(
      id: "3",
      name: "Black Dress",
      picture: "images/products/dress2.jpeg",
      oldPrice: 95,
      price: 55,
  ),
    Product(
      id: "4",
      name: "Red dress",
      picture: "images/products/dress1.jpeg",
      oldPrice: 100,
      price: 50,
    ),
    Product(
      id: "5",
      name: "Heels",
      picture: "images/products/hills1.jpeg",
      oldPrice: 145,
      price: 85,
    ),
    Product(
      id: "6",
      name: "Hills",
      picture: "images/products/hills2.jpeg",
      oldPrice: 75,
      price: 45,
    ),
    Product(
      id: "7",
      name: "Pants",
      picture: "images/products/pants1.jpg",
          oldPrice: 85,
      price: 60,
  ),
    Product(
      id: "8",
      name: "jeans",
      picture: "images/products/pants2.jpeg",
      oldPrice: 90,
      price: 70,
    ),
    Product(
      id: "9",
      name: "Shoes",
      picture: "images/products/shoe1.jpg",
      oldPrice: 125,
      price: 100,
    ),
    Product(
      id: "10",
      name: "Long skirts",
      picture: "images/products/skt1.jpeg",
      oldPrice: 130,
      price: 85,
  ),
    Product(
      id: "11",
      name: "Short skirts",
      picture:"images/products/skt2.jpeg",
      oldPrice: 115,
      price: 75,
    ),
  ];

  List<Product> _similarItems = [
    Product(
      id: "1",
      name: "Shirts",
      picture: "images/products/blazer1.jpeg",
      oldPrice: 120,
      price: 85,
    ),
    Product(
      id: "2",
      name: "tshirts",
      picture: "images/products/blazer2.jpeg",
      oldPrice: 110,
      price: 75,
    ),
    Product(
      id: "3",
      name: "Black Dress",
      picture: "images/products/dress2.jpeg",
      oldPrice: 95,
      price: 55,
    ),
    Product(
      id: "4",
      name: "Red dress",
      picture: "images/products/dress1.jpeg",
      oldPrice: 100,
      price: 50,
    ),
    Product(
      id: "5",
      name: "Heels",
      picture: "images/products/hills1.jpeg",
      oldPrice: 145,
      price: 85,
    ),
    Product(
      id: "6",
      name: "Hills",
      picture: "images/products/hills2.jpeg",
      oldPrice: 75,
      price: 45,
    ),
    Product(
      id: "7",
      name: "Pants",
      picture: "images/products/pants1.jpg",
      oldPrice: 85,
      price: 60,
    ),
    Product(
      id: "8",
      name: "jeans",
      picture: "images/products/pants2.jpeg",
      oldPrice: 90,
      price: 70,
    ),
    Product(
      id: "9",
      name: "Shoes",
      picture: "images/products/shoe1.jpg",
      oldPrice: 125,
      price: 100,
    ),
    Product(
      id: "10",
      name: "Long skirts",
      picture: "images/products/skt1.jpeg",
      oldPrice: 130,
      price: 85,
    ),
    Product(
      id: "11",
      name: "Short skirts",
      picture:"images/products/skt2.jpeg",
      oldPrice: 115,
      price: 75,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get similarItems {
    return [..._similarItems];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }

  Product findSimilarItemsById(String id) {
    return _similarItems.firstWhere((pdt) => pdt.id == id);
  }
}