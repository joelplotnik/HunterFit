import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'fire_auth.dart';
import 'navigation_view.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();

}
class _ProfilePageState extends State<ProfilePage> {

  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_currentUser.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            _currentUser.emailVerified
                ? Text(
              'Email verified',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.green),
            )
                : Text(
              'Email not verified',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () async {
                await _currentUser.sendEmailVerification();
              },
              child: Text('Verify email'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Sign out')
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                User? user = await FireAuth.refreshUser(_currentUser);
                if (user != null) {
                  setState(() {
                    _currentUser = user;
                  });
                }
              },
            ),
            ElevatedButton(
              child: const Text(
                'Log in',
                textAlign: TextAlign.center,
              ),
              onPressed: () {




                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Navigation()),
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
            // Add widgets for verifying email
            // and, signing out the user
          ],

        ),
      ),

    );

  }
}