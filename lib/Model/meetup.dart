import 'package:cloud_firestore/cloud_firestore.dart';

class Meetup {
  String uid;
  Meetup({this.uid});
  Meetup.fromSnap(DocumentSnapshot doc) : uid = doc.id;
}
