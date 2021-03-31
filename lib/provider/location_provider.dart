import 'package:flutter/material.dart';
import 'package:weather_app/models/location_model.dart';

class LocationProvider with ChangeNotifier {
  Location _location;

  LocationProvider(this._location);

  Location get getLocation => this._location;

  set setLocation(Location location) {
    _location = location;
    notifyListeners();
  }
}
