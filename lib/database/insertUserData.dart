import 'getUserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hunter_fit/widgets/stopwatch.dart';

class insertUserData {
  Future<void> addUserTime(Duration duration) async {
    getUserData database =
        await getUserData(); //wait to initialize an instance if Firestore
    var currentUID =
        await database.getCurrentUserID(); //wait to fetch user ID from DB
    var time = duration;
    // var parsedTime = parseDuration(time);
    // print('Time unparsed is: $duration');
    // print('Time parsed is: ${parseDuration(time)}');
    // print('Time parsed + parsed: ${parsedTime + parsedTime}');

    return database
        .workoutCollection //users > UID > workoutData > weightsData >
        .doc(currentUID.toString())
        .collection('workoutData')
        .doc('weightsData')
        .set({
          'TIMES': FieldValue.arrayUnion([time])
        }, SetOptions(merge: true))
        .then((value) => print('Time added'))
        .catchError(
            (error) => print('Failed to add time to database because: $error'));
  }
}
