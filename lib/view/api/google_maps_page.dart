import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunter_fit/viewmodel/provider/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:hunter_fit/view/widgets/cardio_stopwatch.dart';

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
    // !!!! Call clearLocation here!!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: googleMapUI(),
      backgroundColor: Colors.grey.shade300,
    );
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      return Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
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
          RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                TextSpan(
                    text: model.distanceTraveledMiles,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        backgroundColor: Colors.grey.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 46))
              ])),
          RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                TextSpan(
                    text: "MILES",
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        decoration: TextDecoration.none,
                        backgroundColor: Colors.grey.shade300,
                        //color: ,
                        fontWeight: FontWeight.normal,
                        fontSize: 18))
              ])),
          const SizedBox(
            height: 20,
          )
          /*Text(model.distanceTraveled + " kilometers",
              textAlign: TextAlign.left),*/
          /*Text(model.distanceTraveledMiles + " miles",
              textAlign: TextAlign.left),*/
        ],
      );
    });
  }
}
