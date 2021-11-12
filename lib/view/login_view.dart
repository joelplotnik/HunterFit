import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/view/signup_view.dart';
import 'package:hunter_fit/view/weights_view.dart';
import 'package:hunter_fit/view/cardio_view.dart';
import 'package:hunter_fit/viewmodel/login_viewmodel.dart';
import 'package:hunter_fit/view/forms/login_form.dart';

// LoginView is the first screen a user will see upon launching the system
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                const LoginForm(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
