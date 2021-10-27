import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/viewmodel/login_viewmodel.dart';

// LoginPage is the first screen a user will see upon launching the system
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  var loginViewModel = LoginViewModel();

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
                    const SizedBox(height: 150),
                    // HunterFit logo
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/logo-hunter-fit.svg"),
                    ),
                    const SizedBox(height: 30),
                    // Container for username and password
                    Container(
                        width: 268,
                        height: 103,
                        decoration: const BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color : Color.fromRGBO(255, 255, 255, 1),
                        )
                    ),
                    const SizedBox(height: 30),
                    // Log in button
                    SizedBox(
                        width: 268,
                        height: 42,
                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 268,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        color : Color.fromRGBO(255, 255, 255, 0.20000000298023224),
                                      )
                                  )
                              ),
                              Positioned(
                                  top: 10,
                                  left: 109,
                                  child: Text(loginViewModel.loginButtonText, textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                    ),)
                              ),
                            ]
                        )
                    ),
                    const SizedBox(height: 30),
                    // Sign up button
                    Text(loginViewModel.signupButtonText, textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                  ],
                )
              ],
            )
        )
    );
  }
}