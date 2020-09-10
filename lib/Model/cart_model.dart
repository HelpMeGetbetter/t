import 'package:flutter/foundation.dart';
import 'package:flutter_auth/Model/products.dart';

class CartModel with ChangeNotifier{
  final String id;
  final String name;
  final int quantity;
  final String picture;
  final double price;
  final double oldPrice;

  CartModel({this.oldPrice, @required this.picture,
      @required this.id,
        @required this.name,
        @required this.quantity,
        @required this.price});
}

class CartModels with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
              (existingCartItem) =>
              CartModel(
                  id: DateTime.now().toString(),
                  name: existingCartItem.name,
                  quantity: existingCartItem.quantity + 1,
                  price: existingCartItem.price, picture: product.picture));
    } else {
      _items.putIfAbsent(
          product.id,
              () =>
              CartModel(
                name: product.name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: product.price, picture: product.picture,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
              (existingCartItem) =>
              CartModel(
                  id: DateTime.now().toString(),
                  name: existingCartItem.name,
                  quantity: existingCartItem.quantity - 1,
                  price: existingCartItem.price, picture: existingCartItem.picture));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}