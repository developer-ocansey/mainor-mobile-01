/* providers/provider.dart */

import 'package:flutter/material.dart';
import 'package:simplecalculator/models/history.dart';
import 'package:simplecalculator/services/firestore.dart';
import 'package:uuid/uuid.dart';

class HistoryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  var uuid = Uuid();

  saveOperation(String operation) {
    var newOperation = History(
        operation: operation,
        timeStamp: new DateTime.now().microsecondsSinceEpoch.toString(),
        cid: uuid.v4());
    print(newOperation);
    firestoreService.saveOperation(newOperation);
  }

  removeOperation(String cid) {
    firestoreService.removeOperation(cid);
  }
}
