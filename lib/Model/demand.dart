import 'package:cloud_firestore/cloud_firestore.dart';

class Demand {
  String uid;
  Demand({this.uid});
  Demand.fromSnap(DocumentSnapshot doc) : uid = doc.id;
}
