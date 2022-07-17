import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/logic/models/foods.dart';
import 'package:food/logic/store/store.dart';

Store store = Store();

final pizzaProvider = FutureProvider<List<FoodModel>>((ref) async {
  return await store.getPizzas();
});

final storeProvider = ChangeNotifierProvider<Store>((ref) {
  return Store();
});
