import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StreamBloc with ChangeNotifier {
  Stream infoStream;
  List<QueryDocumentSnapshot> _requests = [];
  List<String> requestUids = [];
  List<QueryDocumentSnapshot> get requests => _requests;

  StreamBloc() {
    //getMeeterUids();
    //getDemandUids();
    getRequestUids();
    getStreamData();
    //getStreamData2();
    // getNearestStreamData();
  }

  getStreamData() {
    if (infoStream == null) {
      infoStream = Stream<List<int>>.periodic(Duration(seconds: 5), (x) {
        //for listening sake but List not used
        getRequests(requestUids);
        return [0, 1];
      });
    }
    infoStream.listen((event) {});
  }

  getRequestUids() {
    FirebaseFirestore.instance
        .collection('requests')
        .snapshots()
        .listen((event) async {
      requestUids = [];
      for (int i = 0; i < event.docs.length; i++) {
        requestUids.add(event.docs[i].id);
        //notifyListeners();
      }
    });
  }

  getRequests(ids) async {
    _requests = [];
    for (int i = 0; i < ids.length; i++) {
      QuerySnapshot event = await FirebaseFirestore.instance
          .collection('requests')
          .doc(ids[i])
          .collection('request')
          .orderBy("ts")
          .get();

      for (int i = 0; i < event.docs.length; i++) {
        _requests.add(event.docs[i]);
      }
      if (i == ids.length - 1) {
        notifyListeners();
      }
    }
  }

  /*getStreamData2() {
    if (infoStream2 == null) {
      infoStream2 = Stream<List<int>>.periodic(Duration(seconds: 8), (x) {
        //for listening sake but List not used
        getMeeterCollection(meeterUids);
        getDemandCollection(demandUids);
        print("2222222222222222");
        return [0, 1];
      });
    }
    infoStream2.listen((event) {});
  }

  getNearestStreamData() {
    if (infoStream3 == null) {
      infoStream3 = Stream<List<int>>.periodic(Duration(seconds: 50), (x) {
        //for listening sake but List not used
        getNearestMeeterCollection(meeterUids);
        getNearestDemandCollection(demandUids);
        print("!!!!!!!!!!!");
        return [0, 1];
      });
    }
    infoStream3.listen((event) {});
  }

  getMeeterUids() {
    FirebaseFirestore.instance
        .collection('meeters')
        .snapshots()
        .listen((event) {
      meeterUids = [];
      for (int i = 0; i < event.docs.length; i++) {
        meeterUids.add(event.docs[i].id);
      }
      print(meeterUids);
      // notifyListeners();
    });
  }

  getMeeterCollection(ids) async {
    _meetersCollection = [];
    for (int i = 0; i < ids.length; i++) {
      QuerySnapshot event = await FirebaseFirestore.instance
          .collection('meeters')
          .doc(ids[i])
          .collection('meeter')
          .get();
      for (int i = 0; i < event.docs.length; i++) {
        _meetersCollection.add(event.docs[i]);
      }
      if (i == ids.length - 1) {
        notifyListeners();
      }
    }
  }

  getNearestMeeterCollection(ids) async {
    List<QueryDocumentSnapshot> collection = [];
    _meetersNearestCollection = [];
    Position pos = await GeoLocatorService().getLocation();
    for (int i = 0; i < ids.length; i++) {
      QuerySnapshot event = await FirebaseFirestore.instance
          .collection('meeters')
          .doc(ids[i])
          .collection('meeter')
          .get();
      for (int i = 0; i < event.docs.length; i++) {
        collection.add(event.docs[i]);
      }
    }
    collection.forEach((element) {
      GeoLocatorService()
          .getDistance(
              pos.latitude, pos.longitude, element["lat"], element["long"])
          .then((value) {
        print(value);
        if (value <= 300000) {
          _meetersNearestCollection.add(element);
        }
      });
    });
    notifyListeners();
  }


  getDemandUids() {
    FirebaseFirestore.instance
        .collection('demands')
        .snapshots()
        .listen((event) {
      demandUids = [];
      for (int i = 0; i < event.docs.length; i++) {
        demandUids.add(event.docs[i].id);
        //notifyListeners();
      }
    });
  }

  getDemandCollection(ids) async {
    _demandsCollection = [];
    for (int i = 0; i < ids.length; i++) {
      QuerySnapshot event = await FirebaseFirestore.instance
          .collection('demands')
          .doc(ids[i])
          .collection('demand')
          .get();
      for (int i = 0; i < event.docs.length; i++) {
        _demandsCollection.add(event.docs[i]);
      }
      if (i == ids.length - 1) {
        notifyListeners();
      }
    }
  }

  getNearestDemandCollection(ids) async {
    List<QueryDocumentSnapshot> collection = [];
    _demandsNearestCollection = [];
    Position pos = await GeoLocatorService().getLocation();
    for (int i = 0; i < ids.length; i++) {
      QuerySnapshot event = await FirebaseFirestore.instance
          .collection('demands')
          .doc(ids[i])
          .collection('demand')
          .get();
      for (int i = 0; i < event.docs.length; i++) {
        collection.add(event.docs[i]);
      }
    }
    collection.forEach((element) {
      GeoLocatorService()
          .getDistance(
              pos.latitude, pos.longitude, element["lat"], element["long"])
          .then((value) {
        print(value);
        if (value <= 300000) {
          _demandsNearestCollection.add(element);
        }
      });
    });
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }*/
}
