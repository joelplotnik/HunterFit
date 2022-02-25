
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class getUserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference workoutCollection =
      FirebaseFirestore.instance.collection('users');
CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');
  getCurrentUserID() async {
    final user = await auth.currentUser;
    final uid = await user?.uid;
    //print('This is Current user ID: $uid');
    return uid;
  }

  getTotalWeightTime() async {
    var tempArray = [];
    var temp;
    await workoutCollection //users > UID > workoutData > weightsData >
        .doc(getCurrentUserID().toString())
        .collection('workoutData')
        .doc('weightsData')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists');
      } else
        print(documentSnapshot.data());
    }).catchError((error) => print("failed bc $error"));
    //     .then((value) {
    //   print('Retrieved data DB: weightsData');
    //   tempArray = value.data()['TIMES'];
    //   print(tempArray);
    // }).catchError((error) =>
    //         print('Failed to retrieve weightsData from DB because: $error'));
  }
  getUsersGroupsListStreamSnapshots() async {
    var data = await workoutCollection
        .doc(getCurrentUserID().toString())
        .collection('groups')
        .doc('mygroups')
        .get();
    return data;

  }
}
