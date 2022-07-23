import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:food/logic/models/foods.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Store extends ChangeNotifier {
  static const _baseUrl = 'https://pizza-and-desserts.p.rapidapi.com/pizzas';
  static const Map<String, String> _header = {
    'X-RapidAPI-Key': 'd78d8247b8mshee45bad1adaa238p14c5c2jsn33eb1a6451a1',
    'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
  };
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems;

  Future<List<FoodModel>> getPizzas() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: _header);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((pizza) => FoodModel.fromJson(pizza)).toList();
    } else {
      throw Exception('Failed to load pizza');
    }
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    } else {
      return quantity;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      print('increment');
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    notifyListeners();
  }

  initValue() {
    _quantity = 0;
    _inCartItems = 0;
  }
}
