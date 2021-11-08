import 'dart:convert';
import 'dart:io';
import 'package:hunter_fit/model/user_model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SignupViewModel {

  late User userModel;
  final List<String> _userNamePassList = [];

  void loadUserData() async {
    Future<String> futureString = Future.value(await rootBundle.loadString('assets/user_data.txt'));
    String userData = await futureString;
    LineSplitter.split(userData).forEach((line) => _userNamePassList.add(line));

  }

  /*
    Method to find if a user already exists within the system.
   */
  bool validateUserExists(String username) {

    String tempUsername = username.toLowerCase();

    for (var i = 0; i < _userNamePassList.length; i++)
    {
      if (tempUsername == _userNamePassList[i]) {
        return true;
      }
    }

    // addUser(tempUsername);

    return false;
  }


  void addUser (String text) async {
    //final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File(await rootBundle.loadString('assets/user_data.txt'));
    await file.writeAsString(text);
  }
}
