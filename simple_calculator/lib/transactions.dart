
class Transactions {
  final int? id;
  final String operation;
  final String timestamp;

  Transactions({ this.id,
    required this.operation,
    required this.timestamp,
  }
  );

  Transactions.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        operation = res["operation"],
        timestamp = res["operation"],


  Map<String, Object?> toMap() {
    return {'id':id,'operation': operation, 'timestamp': timestamp,};
  }
}