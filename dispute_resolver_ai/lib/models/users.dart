import 'package:cloud_firestore/cloud_firestore.dart';

class MyUsers {
  final String id;
  final String name;
  final String imageUrl;
  final DateTime? createdAt;

  MyUsers({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.createdAt,
  });

  factory MyUsers.fromJson(Map<String, dynamic> json) {
    return MyUsers(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.parse(json['createdAt']))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'createdAt': createdAt != null ? createdAt!.toIso8601String() : null,
    };
  }
}
