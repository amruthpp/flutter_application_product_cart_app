import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_product_cart_app/model/cart_model.dart';
import 'package:hive/hive.dart';


class CartScreenController with ChangeNotifier {
  final cartbox = Hive.box<CartModel>("cartBox");
  List<CartModel> cart = [];
  List keys = [];

  double totalCartValue = 0;

  Future<void> addProduct(
      {required String name,
      String? image,
      String? desc,
      required int id,
      required double price}) async {
    bool isAlreadyInCart = false;

    for (int i = 0; i < cart.length; i++) {
      if (id == cart[i].id) {
        isAlreadyInCart = true;
      }
      print(isAlreadyInCart);
    }

    //----------------------------------
    if (isAlreadyInCart == true) {
      print("Already in cart");
    } else {
      await cartbox.add(CartModel(
        name: name,
        id: id,
        desc: desc,
        image: image,
        price: price,
        qty: 1,
      ));
    }

    getProducts();
  }

  void getProducts() {
    keys = cartbox.keys.toList();
    cart = cartbox.values.toList();
    calculateTotalAmnt();
    notifyListeners();
    debugPrint(keys.toString());
  }

  void removeProcuct(int index) {
    cartbox.deleteAt(index);
    getProducts();
  }

  void incrementQty(int index) {
    keys[index];

    int currentQty = cart[index].qty ?? 1;
    currentQty++;
    log(currentQty.toString());
    cartbox.put(
        keys[index],
        CartModel(
          id: cart[index].id,
          desc: cart[index].desc,
          image: cart[index].image,
          name: cart[index].name,
          price: cart[index].price,
          qty: currentQty,
        ));
    getProducts();
  }

  void decrementQty(int index) {
    keys[index];

    int currentQty = cart[index].qty ?? 1;

    if (currentQty > 1) {
      currentQty--;
      log(currentQty.toString());
      cartbox.put(
          keys[index],
          CartModel(
            id: cart[index].id,
            desc: cart[index].desc,
            image: cart[index].image,
            name: cart[index].name,
            price: cart[index].price,
            qty: currentQty,
          ));
      getProducts();
    }
  }

  calculateTotalAmnt() {
    totalCartValue = 0;
    for (int i = 0; i < cart.length; i++) {
      totalCartValue += (cart[i].price! * cart[i].qty!);
    }

    print(totalCartValue);
  }
}