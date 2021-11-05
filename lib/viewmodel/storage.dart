import 'dart:async';
import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class Storage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user_data.txt');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return e.toString();
    }
  }

  Future<File> writeData(String userdata) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(userdata);
  }
}