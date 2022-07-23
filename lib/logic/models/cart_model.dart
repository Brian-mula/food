class CartModel {
  int? id;
  int? quantity;
  bool? isExist;
  String? name;
  String? img;
  int? price;

  CartModel({
    this.id,
    this.quantity,
    this.isExist,
    this.name,
    this.img,
    this.price,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['isExist'] = this.isExist;
    data['name'] = this.name;
    data['img'] = this.img;
    data['price'] = this.price;

    return data;
  }
}
