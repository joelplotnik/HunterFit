import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/viewmodel/signup_form.dart';

// LoginPage is the first screen a user will see upon launching the system
class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF47ABD1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 100),
                // HunterFit logo
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/logo-hunter-fit.svg"),
                ),
                const SizedBox(height: 25),
                // Container for username and password
                const SignupForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
