import 'category.dart';

class Products {
  int? id;
  String title;
  int price;
  String description;
  Category? category;
  int? categoryId;
  List<String> images;

  Products({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    this.categoryId,
    required this.images,
  });

  factory Products.fromJson(dynamic json) {
    return Products(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'] != null
            ? Category.fromJson(json['category'])
            : null,
        images: json['images'] != null ? json['images'].cast<String>() : [],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'categoryId': categoryId,
      'images': images
    };
  }
}
