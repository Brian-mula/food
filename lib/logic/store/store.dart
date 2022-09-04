import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:food/logic/models/foods.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference foods = FirebaseFirestore.instance.collection('foods');

  // get all available food

  Stream<List<FoodModel>> get getAllFood {
    return foods.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return FoodModel.fromJson(doc);
      }).toList();
    });
  }
}
