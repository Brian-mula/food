class FoodModel {
  int? id;
  String? name;
  bool? veg;
  int? price;
  String? description;
  int? quantity;
  String? img;

  FoodModel({
    this.id,
    this.name,
    this.veg,
    this.price,
    this.description,
    this.quantity,
    this.img,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    veg = json['veg'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['veg'] = this.veg;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['img'] = this.img;

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
