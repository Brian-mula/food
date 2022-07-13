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

  Future<List<FoodModel>> getPizzas() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return Foods.fromJson(jsonDecode(response.body)).food;
    } else {
      throw Exception('Failed to load pizza');
    }
  }
}
