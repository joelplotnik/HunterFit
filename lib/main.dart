import 'package:flutter/material.dart';
import 'package:hunter_fit/api/google_maps_page.dart';
import 'package:hunter_fit/provider/location_provider.dart';
import 'package:hunter_fit/view/LoginPage.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// Run HunterFit
void main() {

  runApp(HunterFit());
}

class HunterFit extends StatelessWidget {



  // This widget is the root of the HunterFit application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: const GoogleMapPage(),
        )
      ],
      child: MaterialApp(
        title: 'HunterFit',
        theme: ThemeData(),
        home: LoginPage(),
      ),
    );
  }
}
