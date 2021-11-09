/*import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'dart:math';*/
import 'package:hunter_fit/model/user_model.dart';
import 'package:hunter_fit/helper/db_helper.dart';


class SignupViewModel {

  DBHelper dbHelper = DBHelper();
  List<User> userList = [];

  // Populate the current database of users into _userList
  void getUserDB() async {

    final List<User> tempUserList = await dbHelper.users();

    for (var i = 0; i < tempUserList.length; i++) {
      userList.add(tempUserList[i]);
    }

  }

  bool validateUserExists(String username) {

    for (var i = 0; i < userList.length; i++)
    {
      if (userList[i].username == username) {
        return true;
      }
    }
    return false;

  }


  // THIS NEEDS WORK BECAUSE THE ID IS OVERWRITING ID 1
  void createUser(String name, String pass) async {

    int newUserID = 0;
    bool flag = false;

    // While a matching id has not been found
    while (!flag){
      // Observe each user id
      for (var i = 0; i < userList.length; i++) {

        // If a user id matches newUserID
        if (userList[i].id == i) {

          // There is a user with this id already
          flag = true;
        }
      }
      // NEED TO TRACK THE VALUE OF I SO THAT YOU CAN MATCH THE NEWID TO IT

      // There was a user with the newUserID already
      if (flag) {
        newUserID++; // increment the newUserID
        flag = true; // set idFound flag to false so to re-enter the while loop
      }
      else {
        flag = false;
      }
    }

    var user = User(
      id: newUserID,
      username: name,
      password: pass,
    );


    await dbHelper.insertUser(user);

    getUserDB(); //update the userList

  }

  void printDatabase() async {
    getUserDB();
    print(await dbHelper.users());
  }

}





















/*
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
}*/
