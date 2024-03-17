import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart {
    return [..._cart];
  }

  void addToCart(Map<String, dynamic> product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cart.remove(product);
    notifyListeners();
  }
}
