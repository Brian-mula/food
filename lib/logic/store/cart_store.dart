import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/logic/models/cart_model.dart';
import 'package:food/logic/models/foods.dart';

class CartStore extends ChangeNotifier {
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(FoodModel food, int quantity) {
    _items.putIfAbsent(food.id!, () {
      print('pizza id ${food.id} quantity $quantity');
      return CartModel(
          id: food.id,
          name: food.name,
          img: food.img,
          price: food.price,
          quantity: quantity,
          isExist: true);
    });
  }
}
