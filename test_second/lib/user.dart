class Person {
  String name;
  String imageURL;

  Person({required this.name, required this.imageURL});

  // Method to convert Person object to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageURL": imageURL,
    };
  }

  // Method to create Person object from JSON (Map)
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] as String,
      imageURL: json['imageURL'] as String,
    );
  }
}
