class Users {
  final String uid;
  int lateCount;
  List<Fine> fineHistory;
  bool fineLimitReached;

  Users({required this.uid, this.lateCount = 0, this.fineHistory = const [], this.fineLimitReached = false});

  Map<String, dynamic> toMap() {
    return {
      'lateCount': lateCount,
      'fineHistory': fineHistory.map((fine) => fine.toMap()).toList(),
      'fineLimitReached': fineLimitReached,
    };
  }

  factory Users.fromMap(String uid, Map<String, dynamic> map) {
    return Users(
      uid: uid,
      lateCount: map['lateCount'] ?? 0,
      fineHistory: (map['fineHistory'] as List<dynamic>?)?.map((e) => Fine.fromMap(e)).toList() ?? [],
      fineLimitReached: map['fineLimitReached'] ?? false,
    );
  }
}

class Fine {
  final DateTime date;
  final double amount;
  final String reason;

  Fine({required this.date, required this.amount, required this.reason});

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'amount': amount,
      'reason': reason,
    };
  }

  factory Fine.fromMap(Map<String, dynamic> map) {
    return Fine(
      date: DateTime.parse(map['date']),
      amount: map['amount'].toDouble(),
      reason: map['reason'],
    );
  }
}

class Rule {
  final int minutesLate;
  final double fineAmount;
  final int lateLimit;
  final double increasedFineMultiplier;


  Rule({required this.minutesLate, required this.fineAmount, required this.lateLimit, required this.increasedFineMultiplier});

  Map<String, dynamic> toMap() => {
    'minutesLate': minutesLate,
    'fineAmount': fineAmount,
    'lateLimit': lateLimit,
    'increasedFineMultiplier': increasedFineMultiplier,
  };

  factory Rule.fromMap(Map<String, dynamic> map) {
    return Rule(
      minutesLate: map['minutesLate'],
      fineAmount: map['fineAmount'].toDouble(),
      lateLimit: map['lateLimit'],
      increasedFineMultiplier: map['increasedFineMultiplier'].toDouble(),
    );
  }
}