import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/view/login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late DateTime _dateTime = DateTime.now();
  bool datePickerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi, User',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Let\'s learn about you.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.black,
                      size: 75.0,
                      semanticLabel: 'profile image',
                    ),
                  ]),

                  const SizedBox(height: 50),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name: ',
                    ),
                  ),

                  const SizedBox(height: 50),

                  // *********** THIS BEGINS THE DATE PICKER **************
                  Stack(
                    children: [
                      ElevatedButton(
                        child: const Text(
                          'Birthdate',
                          textAlign: TextAlign.start,
                        ),
                        onPressed: () => setState(
                            () => datePickerVisible = !datePickerVisible),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40),
                          primary: const Color(0xFFefeff0),
                          onPrimary: Colors.black,
                          alignment: Alignment.centerLeft,
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      if (datePickerVisible)
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Choose Date of Birth'),
                                      style: ElevatedButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory,
                                        elevation: 0,
                                        side: const BorderSide(width: 1.0, color: Color(0xFFefeff0),),
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 70,
                                child: CupertinoDatePicker(
                                    backgroundColor: Colors.white,
                                    initialDateTime: _dateTime,
                                    mode: CupertinoDatePickerMode.date,
                                    onDateTimeChanged: (dateTime) {
                                      setState(() {
                                        _dateTime = dateTime;
                                        print(_dateTime);
                                      });
                                    }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () => setState(
                                                () => datePickerVisible = !datePickerVisible),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          side: const BorderSide(width: 1.0, color: Color(0xFFefeff0),),
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.normal),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                            ),
                                          ),
                                        ),
                                        child: const Text('Cancel')),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => setState(
                                              () => datePickerVisible = !datePickerVisible),
                                        child: const Text('OK'),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          side: const BorderSide(width: 1.0, color: Color(0xFFefeff0),),
                                          primary: Colors.white,
                                          onPrimary: Colors.black,
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton(
                    child: const Text(
                      'Log out',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      primary: const Color(0xFF47ABD1),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
