import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simplecalculator/models/history_model.dart';
import 'package:simplecalculator/services/firebase_service.dart';

class HistoryService extends FirebaseService {
  HistoryService();

  @override
  CollectionReference getCollectionReference() {
    return FirebaseService.db.collection("history");
  }

  @override
  String getID() {
    return getCollectionReference().doc().id;
  }

  Stream<QuerySnapshot> getTodoListOfCurrentUser() {
    return getCollectionReference().snapshots();
  }
}
