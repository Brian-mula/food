import 'dart:convert';

import 'package:food/logic/models/foods.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Store {
  static const _baseUrl = 'https://pizza-and-desserts.p.rapidapi.com/pizzas';
  static const Map<String, String> _header = {
    'X-RapidAPI-Key': 'd78d8247b8mshee45bad1adaa238p14c5c2jsn33eb1a6451a1',
    'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
  };
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

  int checkQuantinty(int quantity) {
    if (quantity + _inCartItems < 0) {
      print("you cannot subtract more");

      return 0;
    }
    return _inCartItems;
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _inCartItems = checkQuantinty(_inCartItems + 1);
    } else {
      _inCartItems = checkQuantinty(_inCartItems - 1);
    }
  }
}
