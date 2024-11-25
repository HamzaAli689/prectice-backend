class Users {
  String name;
  String email;
  String password;
  String imageUrl;


  // Constructor
  Users({
    required this.name,
    required this.email,
    required this.password,
    required this.imageUrl,

  });

  // Convert a User object into a Map (toJson)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
    };
  }

  // Create a User object from a Map (fromJson)
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json['name'] as String? ?? '', // Provide default value if null
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',

    );
  }
}
