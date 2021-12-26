import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meeter/Services/geolocator_service.dart';

class LocationProvider with ChangeNotifier {
  GeoLocatorService geoLocatorService = GeoLocatorService();
  Position _position;
  Position get position => _position;

  getLocation() async {
    _position = await geoLocatorService.getLocation();
    notifyListeners();
  }
}
