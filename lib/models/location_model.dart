import 'package:flutter/material.dart';

class Location {
  final int id;
  final String name;
  final String lat;
  final String lon;

  Location({
    @required this.id,
    @required this.name,
    @required this.lat,
    @required this.lon,
  });
}
