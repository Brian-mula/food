import 'package:http/http.dart' as http;

class BurgerStore {
  final _baseUrl = 'https://burgers1.p.rapidapi.com/burgers';
  final Map<String, String> _headers = {
    'X-RapidAPI-Key': 'd78d8247b8mshee45bad1adaa238p14c5c2jsn33eb1a6451a1',
    'X-RapidAPI-Host': 'burgers1.p.rapidapi.com'
  };
}
