import 'package:flutter/material.dart';
import 'package:hunter_fit/view/login_view.dart';

// Run HunterFit
void main() {
  runApp(const HunterFit());
}

class HunterFit extends StatelessWidget {
  const HunterFit({Key? key}) : super(key: key);

  // This widget is the root of the HunterFit application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HunterFit',
      theme: ThemeData(),
      home: LoginView(),
    );
  }
}
