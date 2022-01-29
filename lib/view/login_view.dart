import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class LoginView extends StatelessWidget {


  Future<FirebaseApp> _initializeFirebase() async {

    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Authentication'),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Text('Login'),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

}
/*
// LoginView is the first screen a user will see upon launching the system
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
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
      ),
    );
  }
}
*/
