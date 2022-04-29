import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunter_fit/viewmodel/provider/distance_tracker.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  late Location _location;

  late final DistanceTracker _distanceTracker;

  // late double _distanceTraveled = 0.0;
  // String get distanceTraveled => _distanceTraveled == null ? _distanceTraveled.toString() : '0.00';
  // String get distanceTraveled => _distanceTraveled.toStringAsFixed(2);

  //static late double _distanceTraveledMiles = 0.0;
  //String get distanceTraveledMiles => _distanceTraveledMiles.toStringAsFixed(2);
  String get distanceTraveledMiles {
    var distanceTraveledMiles = _distanceTracker.runningTotalInKm / conversionFactor;
    return distanceTraveledMiles.toStringAsFixed(2);
  }

  Location get location => _location;
  late LatLng _locationPosition;
  LatLng get locationPosition => _locationPosition;

  bool locationServiceActive = true;

  late final List<LatLng> _coordinateList;
  List<LatLng> get coordinateList => _coordinateList;

  //double simulatedTravelPerSecond = 0.0001;
  double simulatedTravelPerSecond = 0.0;

  // to convert km to miles
  var conversionFactor = 1.609344;

  LocationProvider() {
    _location = Location();
    _locationPosition = const LatLng(33.1295, -117.1596);
    _coordinateList = <LatLng>[];
    _distanceTracker = DistanceTracker();
  }

  initialization() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    if (!_serviceEnabled) {
      return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition = LatLng(
          currentLocation.latitude! + simulatedTravelPerSecond,
          currentLocation.longitude!); // CHANGES MADE HERE


      //print(simulatedTravelPerSecond);
      //simulatedTravelPerSecond += 0.0001;
      //_distanceTraveled = _distanceTracker.calculateDistanceKilometers(_locationPosition, singleton.isDistanceTrackingturnedOn);

      /*
      if (stopwatchState.isStopWatchRunning == false) {
        distance
      }*/

      _distanceTracker.calculateDistanceKilometers(
          _locationPosition);

      //_distanceTraveledMiles =
      //    _distanceTraveled / conversionFactor; // convert km to miles

      notifyListeners();

      /*
      // PRINTING OUT COORDINATES AS THEY COME IN
      _coordinateList.add(_locationPosition);
      for (int i = 0; i < coordinateList.length ; i++){
        print(_coordinateList[i]);
      }*/

      //print(_locationPosition);

      /*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXX  WORKING ON LIST OF COORDINATES HERE  XXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       */

      // if the list is empty
      if (_coordinateList.isEmpty) {
        // add LatLng position to the list
        _coordinateList.add(_locationPosition);
        // print the coordinate
        print("COORD " +
            (_coordinateList.length).toString() +
            ": " +
            _coordinateList[_coordinateList.length - 1].toString());
      } else if ((_coordinateList[_coordinateList.length - 1]) !=
          _locationPosition) {
        // add LatLng position to the list
        _coordinateList.add(_locationPosition);
        // print the coordinate
        print("COORD " +
            (_coordinateList.length).toString() +
            ": " +
            (_coordinateList[_coordinateList.length - 1]).toString());
      }
      // print the repeated coordinates coming in
      else {
        print("COORD " +
            (_coordinateList.length).toString() +
            " REPEATED: " +
            (_coordinateList[_coordinateList.length - 1]).toString());
      }
    });
  }
}
