import 'package:food/logic/models/foods.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const _baseUrl = 'https://pizza-and-desserts.p.rapidapi.com/pizzas';
  static const Map<String, String> _header = {
    'X-RapidAPI-Key': 'd78d8247b8mshee45bad1adaa238p14c5c2jsn33eb1a6451a1',
    'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
  };

  Stream<List<FoodModel>> getPizza() async* {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {}
  }
}
