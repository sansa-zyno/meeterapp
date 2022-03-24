import 'package:async/async.dart';
import 'package:meeter/Model/demand.dart';
import 'package:meeter/Model/demand_data.dart';
import 'package:meeter/Model/meetup.dart';
import 'package:meeter/Model/meetup_data.dart';
import 'package:meeter/Services/geolocator_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class FirebaseApi {
  List<String> requestUids = [];
  List<String> meeterUids = [];
  List<String> demandUids = [];

  /*getRequestUids() {
    FirebaseFirestore.instance
        .collection('requests')
        .snapshots()
        .listen((event) {
      requestUids = [];
      for (int i = 0; i < event.docs.length; i++) {
        requestUids.add(event.docs[i].id);
      }
    });
  }*/

  Stream<List<Meetup>> getMeeterUids() {
    return FirebaseFirestore.instance.collection('meeters').snapshots().map(
        (snapshots) =>
            snapshots.docs.map((doc) => Meetup.fromSnap(doc)).toList());
  }

  StreamZip<List<MeetupData>> getMeeterCollection(List<Meetup> meetups) {
    Stream<List<MeetupData>> stream;
    List<Stream<List<MeetupData>>> listOfStreams = [];
    for (Meetup meetup in meetups) {
      stream = FirebaseFirestore.instance
          .collection('meeters')
          .doc(meetup.uid)
          .collection('meeter')
          .snapshots()
          .map((snapshots) =>
              snapshots.docs.map((doc) => MeetupData.fromSnap(doc)).toList());
      listOfStreams.add(stream);
    }
    StreamZip<List<MeetupData>> output = StreamZip(listOfStreams);
    return output;
  }

  Future<List<List<MeetupData>>> getNearestMeeterCollection(
      List<List<MeetupData>> z) async {
    Position pos = await GeoLocatorService().getLocation();
    List<MeetupData> y = z.expand((x) => x).toList();
    List<MeetupData> lmeetups = [];
    List<List<MeetupData>> llmeetups = [];
    for (MeetupData x in y) {
      GeoLocatorService()
          .getDistance(pos.latitude, pos.longitude, x.lat, x.long)
          .then((value) {
        if (value <= 300000) {
          lmeetups.add(x);
        }
      });
    }
    llmeetups.add(lmeetups);
    return llmeetups;
  }

  Stream<List<Demand>> getDemandUids() {
    return FirebaseFirestore.instance.collection('demands').snapshots().map(
        (snapshots) =>
            snapshots.docs.map((doc) => Demand.fromSnap(doc)).toList());
  }

  StreamZip<List<DemandData>> getDemandCollection(List<Demand> demands) {
    Stream<List<DemandData>> stream;
    List<Stream<List<DemandData>>> listOfStreams = [];
    for (Demand demand in demands) {
      stream = FirebaseFirestore.instance
          .collection('demands')
          .doc(demand.uid)
          .collection('demand')
          .snapshots()
          .map((snapshots) =>
              snapshots.docs.map((doc) => DemandData.fromSnap(doc)).toList());
      listOfStreams.add(stream);
    }
    StreamZip<List<DemandData>> output = StreamZip(listOfStreams);
    return output;
  }

  Future<List<List<DemandData>>> getNearestDemandCollection(
      List<List<DemandData>> z) async {
    Position pos = await GeoLocatorService().getLocation();
    List<DemandData> y = z.expand((x) => x).toList();
    List<DemandData> ldemands = [];
    List<List<DemandData>> lldemands = [];
    for (DemandData x in y) {
      GeoLocatorService()
          .getDistance(pos.latitude, pos.longitude, x.lat, x.long)
          .then((value) {
        if (value <= 300000) {
          ldemands.add(x);
        }
      });
    }
    lldemands.add(ldemands);
    return lldemands;
  }

  /*getDemandUids() {
    FirebaseFirestore.instance
        .collection('demands')
        .snapshots()
        .listen((event) {
      demandUids = [];
      for (int i = 0; i < event.docs.length; i++) {
        demandUids.add(event.docs[i].id);
      }
    });
  }

  getRequests(ids) {
    for (int i = 0; i < ids.length; i++) {
      return FirebaseFirestore.instance
          .collection('requests')
          .doc(ids[i])
          .collection('request')
          .orderBy("ts")
          .snapshots();
    }
  }


  

  getDemandCollection(ids) {
    for (int i = 0; i < ids.length; i++) {
      return FirebaseFirestore.instance
          .collection('demands')
          .doc(ids[i])
          .collection('demand')
          .snapshots();
    }
  }

  getNearestDemandCollection(ids) async {
    List<QueryDocumentSnapshot> collection = [];
    Position pos = await GeoLocatorService().getLocation();
    for (int i = 0; i < ids.length; i++) {
      return FirebaseFirestore.instance
          .collection('demands')
          .doc(ids[i])
          .collection('demand')
          .snapshots();
    }
    /*collection.forEach((element) {
      GeoLocatorService()
          .getDistance(
              pos.latitude, pos.longitude, element["lat"], element["long"])
          .then((value) {
        print(value);
        if (value <= 300000) {
          _demandsNearestCollection.add(element);
        }
      });
    });*/
  }*/
}
