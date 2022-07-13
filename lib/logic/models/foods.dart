class Foods {
  String? title;
  String? size;
  String? time;
  String? description;
  int? price;
  String? image;

  Foods(
      {required this.title,
      required this.size,
      required this.time,
      required this.description,
      required this.price,
      required this.image});

  Foods.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    size = json['size'];
    time = json['time'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'size': size,
        'time': time,
        'description': description,
        'price': price,
        'image': image
      };
}
