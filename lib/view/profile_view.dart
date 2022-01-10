import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hunter_fit/view/login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //late DateTime _dateTime = DateTime.now();
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
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/profile_photo.jpg"),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: TextButton(
                              onPressed: () => {},
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Color(0xFF47ABD1),
                                size: 38,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
                    child: Container(
                      height: 50,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Name: ',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1.0, color: Colors.black54)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
                    child: Container(
                      height: 50,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Age: ',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1.0, color: Colors.black54)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
                    child: Container(
                      height: 50,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Weight: ',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1.0, color: Colors.black54)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
                    child: Container(
                      height: 100,
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Goals: ',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1.0, color: Colors.black54)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    child: const Text(
                      'Save',
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

                  const SizedBox(height: 20),

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
