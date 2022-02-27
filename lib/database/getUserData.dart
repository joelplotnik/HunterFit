import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class getUserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference workoutCollection =
      FirebaseFirestore.instance.collection('users');

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
}
