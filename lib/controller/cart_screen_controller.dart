import 'package:flutter/material.dart';
import 'package:flutter_application_product_cart_app/model/cart_model.dart';
import 'package:hive/hive.dart';


class CartScreenController with ChangeNotifier {
  final cartbox = Hive.box<CartModel>("cartBox");
  List<CartModel> cart = [];
  List keys = [];

  Future<void> addProduct(
      {required String name,
      String? image,
      String? desc,
      required int id,
      required double price}) async {
   await  cartbox.add(CartModel(
      name: name,
      id: id,
      desc: desc,
      image: image,
      price: price,
      qty: 1,
    ));

    getProducts();
  }

  void getProducts() {

  keys = cartbox.keys.toList();
  cart = cartbox.values.toList();
  notifyListeners();
  debugPrint(keys.toString());


  }
  void removeProcuct(int index) {

    cartbox.deleteAt(index);
    getProducts();
  }
  void incrementQty() {
   
  }
  void decrementQty() {}
}