// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunter_fit/main.dart';
import 'package:hunter_fit/provider/distance_tracker.dart';

void main() {
  test('Should return a distance of 0 when its the first location received', () {

    final distance_tracker = const DistanceTracker();

    var result = distance_tracker.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));

    expect(result,0.1);
  });

  test('Should return a distance of 0 when first and second'
      'location are the same', () {

    final distance_tracker = const DistanceTracker();

    var result = distance_tracker.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));
    var result2 = distance_tracker.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));

    expect(result2,0.0);
  });
}
