/* models/history.dart */

class History {
  final String cid;
  String operation;
  final String timeStamp;

  History({this.cid, this.operation, this.timeStamp});

  Map toMap() {
    return {
      'cid': cid,
      'operation': operation,
      'timeStamp': timeStamp,
    };
  }

  History.fromFirestore(Map firestore)
      : cid = firestore['cid'],
        operation = firestore['operation'],
        timeStamp = firestore['timeStamp'];
}
