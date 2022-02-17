import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getUserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference workoutCollection =
      FirebaseFirestore.instance.collection('users');

  getCurrentUserID() async {
    final user = await auth.currentUser;
    final uid = await user?.uid;
    //print('This is Current user ID: $uid');
    return uid;
  }
}
