
class Category {
  int id;
  String name;
  String image;
  Category({
      required this.id,
      required this.name,
      required this.image,});

  factory Category.fromJson(dynamic json) {
    return Category(
    id : json['id'],
    name : json['name'],
    image : json['image']
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}