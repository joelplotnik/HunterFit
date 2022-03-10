import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/model/database/insertUserData.dart';
import 'package:hunter_fit/model/database/getUserData.dart';
import 'package:sqflite/sqflite.dart';

class GroupsView extends StatefulWidget {
  final User user;
  const GroupsView({Key? key, required this.user}) : super(key: key);

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  insertUserData insertToDB = insertUserData();
  getUserData getFromDB = getUserData();
  late List<dynamic> groups;
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };
  Future<dynamic> fetchGroupList() async {

    return await getFromDB.getUsersGroupsListStreamSnapshots();
  }

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      insertToDB.insertNewGroupIntoUserlist(nameController.text);
      insertToDB.insertNewGroupIntoDB(nameController.text);
      @override
      State<GroupsView> createState() => _GroupsViewState();
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

                        child: FutureBuilder(
                          future: fetchGroupList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              else if (snapshot.hasError ) {
                                return CircularProgressIndicator();

                              } else
                              {
                                groups=snapshot.data['Groups'];
                                return Expanded(child: ListView.builder(
                                    itemCount : groups.length,
                                    itemBuilder: (context,index){
                                  return Container(
                                    height: 50,
                                    color: Colors.white70,
                                    child: Center(child: Text('${groups[index]}')),

                                  );
index--;
                                }));
                                  //Text(
                                  //'${snapshot.data['Groups']}',
                                  //style: TextStyle(
                                 //     fontSize: 20,
                                 //     fontWeight: FontWeight.bold),
                              //  );
                              }

                            }  else {
                              return Text(
                                'Hello, Join or create a group!',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              );
                            }
                          },
                        ),

  ),
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
