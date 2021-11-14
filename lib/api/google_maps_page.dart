import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(33.1295, -117.1596), zoom: 18),
              onMapCreated: (GoogleMapController controller) {},
            ),
          ),
          Column(
            children: const [
            SizedBox(
              height: 100,),
              Text('Stopwatch and Start'),
              Text('Stop, Reset buttons here'),
              Text('Future... Save the workout'),
              SizedBox(
                height: 120,),
          ],)
        ],
      ),
    );
  }
}
