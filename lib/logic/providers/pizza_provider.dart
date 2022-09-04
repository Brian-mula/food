import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/logic/models/foods.dart';
import 'package:food/logic/store/store.dart';

Store store = Store();

final allFoodProvider = StreamProvider<List<FoodModel>>((ref) async* {
  yield* store.getAllFood;
});
