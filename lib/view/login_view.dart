import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/view/signup_view.dart';
import 'package:hunter_fit/view/weights_view.dart';
import 'package:hunter_fit/viewmodel/login_viewmodel.dart';

// LoginPage is the first screen a user will see upon launching the system
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModel = LoginViewModel();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 150),
                // HunterFit logo
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/logo-hunter-fit.svg"),
                ),
                const SizedBox(height: 30),
                // Container for username and password
                TextField(
                  autofocus: false,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Username',
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  controller: usernameController,
                ),
                const SizedBox(height: 30),

                TextField(
                  obscureText: true,
                  autofocus: false,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  controller: passwordController,
                ),

                const SizedBox(height: 25),
                // Log in button
                ElevatedButton(
                  child: Text(
                    loginViewModel.loginButtonText,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    print(usernameController.text);
                    print(passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeightsView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    primary: const Color(0xFF7ebbd7),
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, bottom: 8.0, top: 8.0),
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                // Sign up button
                TextButton(
                  child: Text(
                    loginViewModel.signupButtonText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
