import 'package:hunter_fit/model/user_model.dart';
import 'package:hunter_fit/helper/db_helper.dart';

/*
class LoginViewModel {
  DBHelper dbHelper = DBHelper();
  List<User> userList = [];

  // Populate the current database of users into _userList
  void getUserDB() async {
    final List<User> tempUserList = await dbHelper.users();

    for (var i = 0; i < tempUserList.length; i++) {
      userList.add(tempUserList[i]);
    }
  }

  // Check to see if user already exists in the database
  bool validateUserExists(String name) {
    var tempName = name.toLowerCase();

    for (var i = 0; i < userList.length; i++) {
      if (userList[i].username == tempName) {
        return true;
      }
    }
    return false;
  }

  // Check to see if password is correct for user
  bool validateUserPassword(String name, String password) {
    var tempName = name.toLowerCase();

    if (validateUserExists(name)) {
      for (var i = 0; i < userList.length; i++) {
        if (userList[i].username == tempName) {
          if (userList[i].password == password) {
            return true;
          }
        }
      }
    }

    return false;
  }

  // Delete user
  void deleteUser(String name) async {
    var tempName = name.toLowerCase();

    for (var i = 0; i < userList.length; i++) {
      if (userList[i].username == tempName) {
        await dbHelper.deleteUser(i); // delete user
      }
    }
  }

  // Print the current database
  void printDatabase() async {
    getUserDB();
    print(await dbHelper.users());
  }
}
*/