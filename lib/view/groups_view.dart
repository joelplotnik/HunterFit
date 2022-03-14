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
  var heightexpanse=50.0;
  final _formKey = GlobalKey<FormState>();
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

    @override
    State<GroupsView> createState() => _GroupsViewState();
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
            style: ElevatedButton.styleFrom(

              primary:  const Color(0xFF47ABD1),

              textStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
            ),
            onPressed: () {

              addItemToList();
            },
          ),
          Expanded(

                        child: FutureBuilder(
                          //future: fetchGroupList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {

                            try {

                              if (snapshot.hasData) {
                                if (ConnectionState.done != null && snapshot.hasError) {
                                  return Container();
                                }
                                else  {
                                  groups = snapshot.data['Groups'];
                                  return  ListView.builder(
                                      itemCount: groups.length,
                                      addAutomaticKeepAlives: true,
                                      shrinkWrap: true,

                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return Container(
                                          //height: heightexpanse,
                                          margin: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF47ABD1),

                                              border: Border.all(

                                                color: const Color(0xFF47ABD1),
                                              ),
                                              borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                                          ),

                                          child: ListTile(
                                              title: Text('${groups[index]}'),
                                            onTap: (){
                                               showDialog(context: context, builder: (BuildContext context) {
                                                 return Scaffold(
                                                   appBar: AppBar(
                                                     backgroundColor: const Color(0xFF47ABD1),
                                                     title: Text('${groups[index]}'),
                                                   ),

                                                   body: Column(
                                                     children: <Widget>[
                                                       Padding(padding: const EdgeInsets.all(20),

                                                     child: Center(
                                                     child: RaisedButton(
                                                       onPressed: () {
                                                         showDialog(
                                                             context: context,
                                                             builder: (BuildContext context) {
                                                               return AlertDialog(
                                                                 content: Stack(
                                                                   overflow: Overflow.visible,
                                                                   children: <Widget>[
                                                                     Positioned(
                                                                       right: -40.0,
                                                                       top: -40.0,
                                                                       child: InkResponse(
                                                                         onTap: () {
                                                                           Navigator.of(context).pop();
                                                                         },
                                                                         child: CircleAvatar(
                                                                           child: Icon(Icons.close),
                                                                           backgroundColor: Colors.red,
                                                                         ),
                                                                       ),
                                                                     ),
                                                                     Form(
                                                                       key: _formKey,
                                                                       child: Column(
                                                                         mainAxisSize: MainAxisSize.min,
                                                                         children: <Widget>[
                                                                           Padding(
                                                                             padding: EdgeInsets.all(8.0),
                                                                             child: TextFormField(),
                                                                           ),
                                                                           Padding(
                                                                             padding: EdgeInsets.all(8.0),
                                                                             child: TextFormField(),
                                                                           ),
                                                                           Padding(
                                                                             padding: const EdgeInsets.all(8.0),
                                                                             child: RaisedButton(
                                                                               child: Text("Submit"),
                                                                               onPressed: () {
                                                                                 if (_formKey.currentState!.validate()) {
                                                                                   _formKey.currentState!.save();
                                                                                 }
                                                                               },
                                                                             ),
                                                                           )
                                                                         ],
                                                                       ),
                                                                     ),
                                                                   ],
                                                                 ),
                                                               );
                                                             });
                                                       },
                                                       child: Text("Invite a new Member"),
                                                     ),),
                                                 ), ], ),
                                                 );
                                               });

                                            },

                                          ),


                                          height: heightexpanse,);

                                      });

                                  //Text(
                                  //'${snapshot.data['Groups']}',
                                  //style: TextStyle(
                                  //     fontSize: 20,
                                  //     fontWeight: FontWeight.bold),
                                  //  );
                                }

                              }
                              else if (snapshot.hasError) {
                                return Text(
                                  '${snapshot.error}',
                                  style: TextStyle(fontSize: 10),
                                );
                              }
                              else {
                                return Text(
                                  'Hello, Join or create a group!',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            } catch(error){
                              return CircularProgressIndicator();

                            }
                          },
                          future: fetchGroupList(),
                        ),


  ),
          const SizedBox(height: 2.0),
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
