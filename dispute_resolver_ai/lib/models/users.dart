class User {
  String id;
  String name;
  String? imageUrl;
  DateTime? createdAt;

  User({required this.id, required this.name, this.imageUrl, this.createdAt});

  // Converts a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt' : createdAt,
    };
  }

  // Creates a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] as DateTime?,
    );
  }
}