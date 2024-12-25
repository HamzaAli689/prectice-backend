class MyUsers {
  String id;
  String name;
  String? imageUrl;
  int? createdAt;

  MyUsers({required this.id, required this.name, this.imageUrl, this.createdAt});

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
  factory MyUsers.fromJson(Map<String, dynamic> json) {
    DateTime mydate = DateTime.parse(json['createdAt']);
    int mymicrosecodedate = mydate.microsecondsSinceEpoch;
    return MyUsers(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: mymicrosecodedate,
    );
  }
}
