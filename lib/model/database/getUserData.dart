import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class getUserData {
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

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

  getCurrentUserID() async {
    final user = await auth.currentUser;
    final uid = await user?.uid;
    return uid;
  }

  String getLogo() =>
      false ? "assets/logo-hunter-fit.svg" : "assets/logo-hunter-fit.svg";

  //String getLogo() => "assets/logo-hunter-fit.svg";

  getTotalWeightTime() async {
    String UID = await getCurrentUserID();
    var snapshot = await userCollection
        .doc(UID)
        .collection('workoutData')
        .doc('weightsData')
        .get();

    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);
        var times = data['TIMES'];

        return times;
      } else if (!snapshot.exists) {
        print(
            'Notice! getTotalweightTime: Document does not exist yet. Creating...');
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  getUsersGroupsListStreamSnapshots() async {
    String UID = await getCurrentUserID();

    var snapshot = await userCollection
        .doc(UID)
        .collection('groups')
        .doc('mygroups')
        .get();
    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);

        return snapshot;
      } else if (!snapshot.exists) {
        print(
            'Error getTotalweightTime: Document does not exist yet. Creating...');
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }

    //     Map<String, dynamic> groups = snapshot.data()!;
    //     var mygroups = groups['Groups'];
    //     print(mygroups);
    //     List groupss = mygroups;
    //     return groupss;
    //   } else {
    //     print('Error Document does not exist');
    //   }
    // } catch (error) {
    //   print("Error: $error");
    // }
  }

  getUsername(var UID) async {
    //var UID = await getCurrentUserID();
    var snapshot =
        await userCollection.doc(UID).collection('userData').doc('name').get();
    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);

        return snapshot;
      } else if (!snapshot.exists) {
        print(
            'Error getTotalweightTime: Document does not exist yet. Creating...');
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
    // try {
    //   if (snapshot.exists) {
    //     Map<String, dynamic> data = snapshot.data()!;
    //     return data['Name'].toString();
    //   } else {
    //     print('Error getUsername: Document does not exist');
    //   }
    // } catch (error) {
    //   print("Error: $error");
    // }
  }

  getGroupsMembersListStreamSnapshots(String group) async {
    String UID = await getCurrentUserID();

    var snapshot = await groupsCollection
        .doc('groups-social')
        .collection('groups')
        .doc(group)
        .get();
    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);

        return snapshot;
      } else if (!snapshot.exists) {
        print(
            'Error getTotalweightTime: Document does not exist yet. Creating...');
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }

    //     Map<String, dynamic> groups = snapshot.data()!;
    //     var mygroups = groups['Groups'];
    //     print(mygroups);
    //     List groupss = mygroups;
    //     return groupss;
    //   } else {
    //     print('Error Document does not exist');
    //   }
    // } catch (error) {
    //   print("Error: $error");
    // }
  }

  getMessages(String name) async {
    // String UID = await getCurrentUserID();

    var snapshot = await messagesCollection
        .doc('names')
        .collection(name)
        .doc('messages')
        .get();
    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);

        return snapshot;
      } else if (!snapshot.exists) {
        print(
            'Error getTotalweightTime: Document does not exist yet. Creating...');
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }

  deleteMessages(String name, String subject) async {
    // String UID = await getCurrentUserID();

    var snapshot = await messagesCollection
        .doc('names')
        .collection(name)
        .doc('messages')
        .set({
          'message': FieldValue.arrayRemove([subject])
        }, SetOptions(merge: true))
        .then((value) => print('message deleted'))
        .catchError(
            (error) => print('Failed to delete database because: $error'));
    return snapshot;
  }

  personExists(String name) async {
    // String UID = await getCurrentUserID();

    var snapshot = await messagesCollection
        .doc('names')
        .collection(name)
        .doc('messages')
        .get();

    try {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()!;
        print(data);

        return snapshot;
      } else if (!snapshot.exists) {
        print(
            'Error getTotalweightTime: Document does not exist yet. Creating...');
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }
}
