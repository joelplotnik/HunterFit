import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunter_fit/viewmodel/provider/distance_tracker.dart';

void main() {
  group('DistanceTracker', () {
    DistanceTracker? distanceTracker;

    setUp(() {
      distanceTracker = DistanceTracker();
    });

    test('Should return a distance of 0 when  the first location is received',
        () {
      var result = distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));

      expect(result, 0);
    });

    test(
        'Should return a distance of 0 km when first and second'
        'location are the same', () {
      distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));
      var result2 = distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));

      expect(result2?.toInt(), 0);
    });

    test(
        'Should return a distance of 1 km when first and second'
        'location are 1 km apart', () {
      distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));
      var result2 = distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1704));

      expect(result2?.toInt(), 1);
    });

    test(
        'Should return a distance of 2 km when total distance is 2 km '
        'but first and last location is the same', () {
      distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));
      var result2 = distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1704));
      var result3 = distanceTracker
          ?.calculateDistanceKilometers(const LatLng(33.1295, -117.1596));

      expect(result3?.toInt(), 2);
    });
  });
}
