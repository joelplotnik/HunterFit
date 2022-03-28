import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hunter_fit/model/database/getUserData.dart';
import 'package:hunter_fit/view/activity/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';

class ActivityView extends StatefulWidget {
  static String routeName = "/activity";

  const ActivityView({Key? key}) : super(key: key);

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  //get from db instantiating the class
  File? image;
  final Storage storage = Storage();
  getUserData getFromDB = getUserData();



  Future pickImage() async {
    try {
      // final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg'],
      );
      if (result == null){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No files')));
      }

      final path = result!.files.single.path;
      // final fileName = result!.files.single.name;

      // print(fileName);

      // final imagePermanent = await saveImagePermanently(image.path);
      // setState(() {
      //   image = File(pic.path);   
      // });
      storage.uploadFile(path!,"picture").then((value) => {
        print("Done")
      });

    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }


  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory= await getApplicationDocumentsDirectory();
  //   final name =    basename (imagePath);
  //   final image = File('${directory.path}/$name');
  //   return File(imagePath).copy(image.path);
  // }
  Future<dynamic> fetchUserData() async {
    return await getFromDB.getUsername(await getFromDB.getCurrentUserID());
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: fetchUserData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Text(
                                  'Hi, ${snapshot.data['Name'][0]}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Text(
                                '${snapshot.error}',
                                style: TextStyle(fontSize: 10),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Let\'s check your activities.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    // TextButton(onPressed: fetchUserData, child: Text('help')),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      child: IconButton(
                          icon: image != null
                              ? Image.file(
                                  image!,
                                  width: 95,
                                  height: 95,
                                )
                              : FlutterLogo(size: 75),
                          tooltip: "Change Profile Picture",
                          onPressed: () {
                            pickImage();
                          }),
                      width: 115,
                      height: 115,
                    ),
                  ]),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width) *
                                        0.30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.12),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.1,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              FontAwesomeIcons.dumbbell,
                                              size: 25,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                'finished',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                overflow: TextOverflow.fade,
                                                softWrap: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Completed Workouts',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 90,
                                    width: (MediaQuery.of(context).size.width) *
                                        0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.12),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.1,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                FontAwesomeIcons.rocket,
                                                size: 20,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  'In progress',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Text(
                                                '2',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Workouts',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 90,
                                    width: (MediaQuery.of(context).size.width) *
                                        0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.12),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.1,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                FontAwesomeIcons.userClock,
                                                size: 20,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  'Time spent',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow: TextOverflow.fade,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: const [
                                              Text(
                                                '20',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Minutes',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
