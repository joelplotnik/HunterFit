
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class getUserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference workoutCollection = FirebaseFirestore.instance.collection('users');
  CollectionReference groupsCollection = FirebaseFirestore.instance.collection('groups');

  getCurrentUserID() async {
    final user = await auth.currentUser;
    final uid = await user?.uid;
    return uid;
  }

  getTotalWeightTime() async {
    String UID = await getCurrentUserID();
    var snapshot = await workoutCollection
        .doc(UID)
        .collection('workoutData')
        .doc('weightsData')
        .get();

    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        var times = data['TIMES'];
        print(times);
      } else {
        print('Error getTotalweightTime: Document does not exist');
      }
    } catch (error) {
      print("Error: $error");
    }
  }
  getUsersGroupsListStreamSnapshots() async {
    String UID = await getCurrentUserID();
    var snapshot = await workoutCollection
        .doc(UID)
        .collection('groups')
        .doc('mygroups')
        .get();
    try {
      if (snapshot.exists) {
        Map<String, dynamic> groups = snapshot.data()!;
        var mygroups = groups['Groups'];
        print(mygroups);
List groupss = mygroups;
        return groupss;
      } else {
        print('Error Document does not exist');
      }
    } catch (error) {
      print("Error: $error");
    }



  }
}
