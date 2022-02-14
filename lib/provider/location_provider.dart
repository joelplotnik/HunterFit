import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  late Location _location;
  Location get location => _location;
  late LatLng _locationPosition;
  LatLng get locationPosition => _locationPosition;

  bool locationServiceActive = true;

  late final List<LatLng> _coordinateList;
  List<LatLng> get coordinateList => _coordinateList;

  LocationProvider() {
    _location = Location();
    _locationPosition = const LatLng(33.1295, -117.1596);
    _coordinateList = <LatLng>[];
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
      _locationPosition = LatLng(currentLocation.latitude!,
          currentLocation.longitude!); // CHANGES MADE HERE

      /*
      _coordinateList.add(_locationPosition);
      for (int i = 0; i < coordinateList.length ; i++){
        print(_coordinateList[i]);
      }*/

      notifyListeners();

      /*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXX  WORKING ON LIST OF COORDINATES HERE  XXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
       */

      //print(_locationPosition);

      // if the list is empty OR only has one coordinate, there is not
      // enough coordinates in the list to make a comparison
      if (_coordinateList.isEmpty) {
        _coordinateList.add(_locationPosition);

        print("COORD " +
            (_coordinateList.length).toString() +
            ": " +
            _coordinateList[_coordinateList.length - 1].toString());

        // if there are at least 2 elements in the list, compare the coordinates
        // if they are different, add the new coordinate to the list
      }
      else if ((_coordinateList[_coordinateList.length - 1]) !=
          (_coordinateList[_coordinateList.length - 2])) {
        _coordinateList.add(_locationPosition);
        print("COORD " +
            (_coordinateList.length).toString() +
            ": " +
            (_coordinateList[_coordinateList.length - 1]).toString());
      } else {
        print("COORD " +
            (_coordinateList.length).toString() +
            " REPEATED: " +
            (_coordinateList[_coordinateList.length - 1]).toString());
      }
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
