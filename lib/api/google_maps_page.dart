import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunter_fit/provider/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:hunter_fit/widgets/cardio_stopwatch.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  CardioStopwatch cardioStopwatch = const CardioStopwatch();


  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: googleMapUI(),
    );
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      return Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:
                  CameraPosition(target: model.locationPosition, zoom: 18),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {},
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.grey.shade300,
          ),
          Expanded(
            flex: 1,
            child: cardioStopwatch,
          ),
          Text(model.distanceTraveled + " kilometers", textAlign: TextAlign.left),
          Text(model.distanceTraveledMiles + " miles", textAlign: TextAlign.left),
        ],
      );
    });
  }
}
