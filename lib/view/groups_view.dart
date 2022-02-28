import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/database/insertUserData.dart';
import 'package:hunter_fit/database/getUserData.dart';

class GroupsView extends StatefulWidget {
  final User user;
  const GroupsView({Key? key, required this.user}) : super(key: key);

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  insertUserData insertToDB = insertUserData();
  getUserData getFromDB = getUserData();
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };

  Future<dynamic> names = getUserData().getUsersGroupsListStreamSnapshots();

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      insertToDB.insertNewGroupIntoUserlist(nameController.text);
      insertToDB.insertNewGroupIntoDB(nameController.text);
    });
  }

  late User _currentUser;
  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    names = getFromDB.getUsersGroupsListStreamSnapshots();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Group Name',
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              addItemToList();
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      margin: const EdgeInsets.all(2),
                      color: const Color(0xFF47ABD1),
                      child: Center(
                          child: Text(
                        '${names} ',
                        style: const TextStyle(fontSize: 18),
                      )),
                    );
                  })),
        ],
      ),
    );
  }
}

/*
Expanded(
 child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        color: Colors.blueAccent,
        width: 3,
        height: 50,
      ),
      const SizedBox(
        width: 100,
        child: TextField(
          decoration: InputDecoration(labelText: "Reps"),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      const SizedBox(
        width: 100,
        child: TextField(
          decoration: InputDecoration(labelText: "Weight"),
        ),
      )
    ],
  ),
)
 */
