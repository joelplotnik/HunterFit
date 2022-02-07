import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'fire_auth.dart';
import 'navigation_view.dart';
import 'validator.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text('Log in'),
          backgroundColor: const Color(0xFF47ABD1),
        ),
        backgroundColor: const Color(0xFF47ABD1),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(42.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 100,),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/logo-hunter-fit.svg"),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameTextController,
                        autofocus: false,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF333333),
                        ),
                        validator: (value) => Validator.validateName(
                          name: value!,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Name',
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
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        controller: _emailTextController,
                        autofocus: false,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF333333),
                        ),
                        validator: (value) => Validator.validateEmail(
                          email: value!,
                        ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
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
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        controller: _passwordTextController,
                        obscureText: true,
                        autofocus: false,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF333333),
                        ),
                        validator: (value) => Validator.validatePassword(
                          password: value!,
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
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      _isProcessing
                          ? const CircularProgressIndicator()
                          : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  //_isProcessing = true; currently bugged
                                });

                                if (_registerFormKey.currentState!
                                    .validate()) {
                                  User? user = await FireAuth
                                      .registerUsingEmailPassword(
                                    name: _nameTextController.text,
                                    email: _emailTextController.text,
                                    password:
                                    _passwordTextController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Navigation(user: user),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                'Sign up',
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
            ),
          ),
        ),
      ),
    );
  }
}