import 'package:flutter/material.dart';
import 'package:hunter_fit/api/google_maps_page.dart';
import 'package:hunter_fit/provider/location_provider.dart';
import 'package:hunter_fit/view/login_view.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// Run HunterFit
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HunterFit());
}

class HunterFit extends StatelessWidget {
  const HunterFit({Key? key}) : super(key: key);

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
        home: const LoginPage(),
      ),
    );
  }
}
