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

  // Create a new user in the database
  void createUser(String name, String pass) async {
    var tempName = name.toLowerCase();

    var user = User(
      id: null,
      username: tempName,
      password: pass,
    );

    await dbHelper.insertUser(user); // insert user
    getUserDB(); // update the userList
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
