import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hunter_fit/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'user_database.db'),
        // When the database is first created, create a table to store users.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Define a function that inserts users into the database
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await DBHelper.database();

    // Insert the User into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the users from the users table.
  Future<List<User>> users() async {
    // Get a reference to the database.
    final db = await DBHelper.database();

    // Query the table for all the Users.
    final List<Map<String, dynamic>> maps = await db.query('users');

    // Convert the List<Map<String, dynamic> into a List<User>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        username: maps[i]['username'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await DBHelper.database();

    // Update the given User.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the User has a matching id.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    // Get a reference to the database.
    final db = await DBHelper.database();

    // Remove the User from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific user.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
