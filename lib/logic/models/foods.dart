import 'package:cloud_firestore/cloud_firestore.dart';

class FoodModel {
  int? id;
  String? title;
  bool? veg;
  int? price;
  String? description;
  int? quantity;
  String? image;

  FoodModel({
    this.id,
    this.title,
    this.veg,
    this.price,
    this.description,
    this.quantity,
    this.image,
  });

  factory FoodModel.fromJson(DocumentSnapshot json) {
    return FoodModel(
      id: json['id'] ?? '',
      title: json['name'] ?? '',
      veg: json['veg'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.title;
    data['veg'] = this.veg;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['img'] = this.image;

    return data;
  }
}

class MediumPan {
  int? price;

  MediumPan({this.price});

  MediumPan.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}
