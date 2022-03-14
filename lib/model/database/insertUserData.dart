import 'package:hunter_fit/model/database/getUserData.dart';
import 'getUserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class insertUserData {
  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  format(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  Future<void> insertWeightTime(Duration duration) async {
    getUserData getData =
        await getUserData(); //wait to initialize an instance if Firestore
    var currentUID =
        await getData.getCurrentUserID(); //wait to fetch user ID from DB
    var time = format(duration);
    // var parsedTime = parseDuration(time);
    // print('Time unparsed is: $duration');
    // print('Time parsed is: ${parseDuration(time)}');
    // print('Time parsed + parsed: ${parsedTime + parsedTime}');

    var times = await getData.getTotalWeightTime();

    return getData.userCollection //users > UID > workoutData > weightsData >
        .doc(currentUID)
        .collection('workoutData')
        .doc('weightsData')
        .set({
          'TIMES': FieldValue.arrayUnion([time])
        }, SetOptions(merge: true))
        .then((value) => print('Time added'))
        .catchError(
            (error) => print('Failed to add time to database because: $error'));
  }

  Future<void> insertNewGroupIntoDB(String groupname) async {
    getUserData getData =
        await getUserData(); //wait to initialize an instance if Firestore
    var currentUID = await getData.getCurrentUserID();
    return getData.groupsCollection
        .doc('groups-social')
        .collection('groups')
        .doc(groupname)
        .set({
          'Members': FieldValue.arrayUnion([currentUID])
        }, SetOptions(merge: true))
        .then((value) => print('Member added'))
        .catchError(
            (error) => print('Failed to add to database because: $error'));
  }

  Future<void> insertNewGroupIntoUserlist(String groupname) async {
    getUserData getData =
        await getUserData(); //wait to initialize an instance if Firestore
    var currentUID = await getData.getCurrentUserID();
    return getData.userCollection
        .doc(currentUID.toString())
        .collection('groups')
        .doc('mygroups')
        .set({
          'Groups': FieldValue.arrayUnion([groupname])
        }, SetOptions(merge: true))
        .then((value) => print('Group added'))
        .catchError(
            (error) => print('Failed to add to database because: $error'));
  }

  Future<void> insertUserName(String userName) async {
    getUserData getData =
        await getUserData(); //wait to initialize an instance if Firestore
    var currentUID = await getData.getCurrentUserID();
    return getData.userCollection //users > UID > userData > weightsData >
        .doc(currentUID)
        .collection('userData')
        .doc('name')
        .set({
          'Name': FieldValue.arrayUnion([userName])
        }, SetOptions(merge: true))
        .then((value) => print('Name added'))
        .catchError(
            (error) => print('Failed to add time to database because: $error'));
  }
}
