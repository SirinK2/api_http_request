class User {
  final String email;
  final String? password;
  final String? name;
  final String? avatar;
  final String? role;
  final int? id;

  User({
    required this.email,
    this.password,
    this.name,
    this.avatar,
    this.role,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      avatar: json['avatar'],
      role: json['role'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['avatar'] = avatar;
    map['role'] = role;
    map['id'] = id;
    return map;
  }
}
