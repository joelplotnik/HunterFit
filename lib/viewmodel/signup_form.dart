import 'package:flutter/material.dart';
import 'package:hunter_fit/viewmodel/signup_viewmodel.dart';
import '../view/login_view.dart';

// Define a custom Form widget.
class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignupFormState extends State<SignupForm> {
  final signupViewModel = SignupViewModel();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: false,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF333333),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'You must enter a username.';
              }
              if (value.length < 2) {
                return 'Username must have more than one character';
              }
            },
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
              enabledBorder: OutlineInputBorder(
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
                  color: Colors.white,),
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
            controller: usernameController,
          ),
          const SizedBox(height: 30),

          TextFormField(
            obscureText: true,
            autofocus: false,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF333333),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'You must enter a password.';
              }
              if (value.length < 2) {
                return 'Password must have more than one character';
              }
            },
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
                color: Colors.white,),
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
            controller: passwordController,
          ),

          const SizedBox(height: 25),

          TextFormField(
            obscureText: true,
            autofocus: false,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF333333),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'You must re-enter the password.';
              }
              if (!(value == passwordController.text)) {
                return 'Passwords must match';
              }
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Re-enter password',
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
                color: Colors.white,),
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
            controller: againPasswordController,
          ),

          const SizedBox(height: 25),
          // submit button
          ElevatedButton(
            child: Text(
              signupViewModel.submitButtonText,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              print(usernameController.text);
              print(passwordController.text);
              print(againPasswordController.text);

              _formKey.currentState!.validate()
                  ? ScaffoldMessenger.of(context).hideCurrentSnackBar()
                  : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Form not submitted')));

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
              signupViewModel.cancelButtonText,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
