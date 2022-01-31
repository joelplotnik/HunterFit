import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/view/validator.dart';
import 'fire_auth.dart';
import 'forms/register_view.dart';
import 'navigation_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    //final _nameTextController = TextEditingController();
    final _emailTextController = TextEditingController();
    final _passwordTextController = TextEditingController();

    //final _focusName = FocusNode();
    final _focusEmail = FocusNode();
    final _focusPassword = FocusNode();

    //bool _isProcessing = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HunterFit Authentication'),
        backgroundColor: const Color(0xFF47ABD1),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                const Text('Login'),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) =>
                            Validator.validateEmail(email: value!),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) =>
                            Validator.validatePassword(password: value!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  User? user =
                                      await FireAuth.signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                          context: context);
                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Navigation(user: user)),
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
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
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
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
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
