import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map> _cartItems = [];

  List<Map> get cartItems => _cartItems;

  void addToCart(Map product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Map product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item['price']);
  }
}
