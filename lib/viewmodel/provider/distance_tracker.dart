import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

//ignore: must_be_immutable
class DistanceTracker {
  bool isStopWatchRunning = false;

  DistanceTracker._privateConstructor();

  static final DistanceTracker _instance = DistanceTracker._privateConstructor();

  factory DistanceTracker() {
    return _instance;
  }

  var listOfLocation = <LatLng>[];
  double runningTotalInKm = 0.0;

  void clearLocations() {
    LatLng? lastLocation = null;

    if (!listOfLocation.isEmpty) {
      lastLocation = listOfLocation.last;
    }

    listOfLocation.clear();
    runningTotalInKm = 0; // do we need this?
    if (lastLocation != null) {
      calculateDistanceKilometers(lastLocation);
    }

  }

  double calculateDistanceKilometers(LatLng location) {
    if (!isStopWatchRunning) {
      return runningTotalInKm;
    }

    if (listOfLocation.isEmpty) {
      listOfLocation.add(location);
      return 0.0;
    }

    var prevLastLocation = listOfLocation.last;
    listOfLocation.add(location);

    // compare each coordinate in the list to the previous
    runningTotalInKm += calculateDistance(prevLastLocation.latitude,
        prevLastLocation.longitude, location.latitude, location.longitude);
    // add to running total
    // return running total

    //return finalDistance;
    return runningTotalInKm;
  }

  // Haversine Formula
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
