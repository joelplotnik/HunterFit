import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

import 'package:hunter_fit/view/widgets/stopwatch_state.dart';

//ignore: must_be_immutable
class DistanceTracker extends StatefulWidget {
  DistanceTracker({Key? key}) : super(key: key);

  @override
  _DistanceTrackerState createState() => _DistanceTrackerState();

  StopwatchState stopwatchState = StopwatchState();

  var listOfLocation = <LatLng>[];
  var runningTotalInKm = 0.0;
  var runningTotalInMi = 0.0;

  void clearLocations() {
    listOfLocation.clear();
    runningTotalInKm = 0;
  }

  double calculateDistanceKilometers(LatLng location,
      [bool isStopWatchRunning = true]) {
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

class _DistanceTrackerState extends State<DistanceTracker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
