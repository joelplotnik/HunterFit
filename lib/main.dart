import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Run HunterFit
void main() {
  runApp(const HunterFit());
}

class HunterFit extends StatelessWidget {
  const HunterFit({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HunterFit',
      theme: ThemeData(),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF47ABD1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 200),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/logo-hunter-fit.svg"),
                  ),
                ],
              )
            ],
          )
        )
    );
  }
}