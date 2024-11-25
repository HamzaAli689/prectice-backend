class Student {
  String id;
  String name;
  int totalFines;
  int lateCount;
  List<Map<String, dynamic>> history;

  Student({
    required this.id,
    required this.name,
    required this.totalFines,
    required this.lateCount,
    required this.history,
  });

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      totalFines: map['totalFines'],
      lateCount: map['lateCount'],
      history: List<Map<String, dynamic>>.from(map['history']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalFines': totalFines,
      'lateCount': lateCount,
      'history': history,
    };
  }
}
