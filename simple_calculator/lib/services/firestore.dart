/* services/firestore.dart */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simplecalculator/models/history.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future saveOperation(History history) {
    return _db.collection('history').doc(history.cid).set(history.toMap());
  }

  Stream getOperations() {
    return _db.collection('history').snapshots().map((snapshot) => snapshot.docs
        .map((document) => History.fromFirestore(document.data()))
        .toList());
  }

  Future removeOperation(String _uuid) {
    return _db.collection('history').doc(_uuid).delete();
  }
}
