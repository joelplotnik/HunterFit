import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  Future<dynamic> fetchMessageList(String displayName) async {

    return await getFromDB.getMessages(displayName);
  }

  Future<dynamic> fetchMemberList(String group) async {

    return await getFromDB.getGroupsMembersListStreamSnapshots(group);
  }

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {

      String? username = _currentUser.displayName;
      insertToDB.insertNewGroupIntoUserlist(nameController.text);
      insertToDB.insertNewGroupIntoDB(nameController.text,username!);
      @override
      State<GroupsView> createState() => _GroupsViewState();
    });
  }
  void acceptInvitation(String newGroup){
    insertToDB.insertNewUserIntoGroupIntoDB(newGroup, _currentUser.displayName.toString());
    insertToDB.insertNewUserIntoGroupIntoUserlist(newGroup,_currentUser.uid.toString() );
  }
void declineInvitation(String group){
    getFromDB.deleteMessages(_currentUser.displayName.toString(), group);
}
void inviteNewUser(String Newuser ){
    setState(() {
     // insertToDB.insertNewUserIntoGroup(_currentGroup, Newuser);
//insertToDB.insertNewUserIntoGroupIntoDB(_currentGroup, Newuser);
//insertToDB.insertNewUserIntoGroupIntoUserlist(_currentGroup, );
insertToDB.sendGroupsInvitation(Newuser, _currentGroup);
    });
}
  late User _currentUser;
  late String _currentGroup;
  @override
  void initState() {
    setState(() {
      _currentUser = widget.user;

      @override
      State<GroupsView> createState() => _GroupsViewState();
      //Navigator.of(context).pop();
      // super.initState();
    });

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
          ElevatedButton(

            child: const Text('Messages'),
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

//getFromDB.getMessages(_currentUser.displayName.toString());


              
                showDialog(context: context, builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => {Navigator.of(context).pop(),
                            initState(),}


                      ),

                      backgroundColor: const Color(0xFF47ABD1),
                      title: Text('Messages'),
                    ),

                    body: Column(
                      children: <Widget>[
                        FutureBuilder(builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {

                          try {
                            // if (ConnectionState.waiting != null ) {
                            //   return CircularProgressIndicator();

                            //  }
                            if (snapshot.hasData) {
                              if (snapshot.hasError) {
                                return Container();
                              }
                              else  {
                                groups = snapshot.data['message'];
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
                                                    Center(
                                                    child: Text('You have been invited to join ${groups[index]}'),

                                                    ),
                                                    Center(
                                                      child: ElevatedButton(

                                                      child: const Text('Accept'),
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
acceptInvitation(groups[index].toString());
declineInvitation(groups[index].toString());

                                                      },
                                                    ),
                                                     ),
                                                    Center( child: ElevatedButton(

                                                      child: const Text('Decline'),
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
declineInvitation(groups[index].toString());

                                                      },
                                                    ),),
                                                    Padding(padding: const EdgeInsets.all(20),




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
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          } catch(error){

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                          future: fetchMessageList(_currentUser.displayName.toString()),
                        ),
                        Padding(padding: const EdgeInsets.all(20),




                        ), ], ),
                  );
                });
                //initState();
              
            },
          ),
          Expanded(

                        child: FutureBuilder(
                          //future: fetchGroupList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {

                            try {

                              if (snapshot.hasData) {
                                if (snapshot.hasError) {
                                  return Text(
                                    'Hello, Join or create a group!',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  );
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
                                              var group = groups[index];
                                              _currentGroup= group as String;
                                               showDialog(context: context, builder: (BuildContext context) {
                                                 return Scaffold(
                                                   appBar: AppBar(
                                                     leading: IconButton(
                                                       icon: Icon(Icons.arrow_back, color: Colors.white),
                                                       onPressed: () => {Navigator.of(context).pop(),
                                                       initState(),}


                                                     ),

                                                     backgroundColor: const Color(0xFF47ABD1),
                                                     title: Text('${groups[index]}'),
                                                   ),

                                                   body: Column(
                                                     children: <Widget>[
                                                       FutureBuilder(builder: (BuildContext context,
                                                       AsyncSnapshot<dynamic> snapshot) {

                                                 try {
                                                 // if (ConnectionState.waiting != null ) {
                                                 //   return CircularProgressIndicator();

                                                 //  }
                                                 if (snapshot.hasData) {
                                                 if (snapshot.hasError) {
                                                 return Container();
                                                 }
                                                 else  {
                                                 groups = snapshot.data['Members'];
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
                                                 return const Center(
                                                 child: CircularProgressIndicator(),
                                                 );
                                                 }
                                                 } catch(error){

                                                   return const Center(
                                                     child: CircularProgressIndicator(),
                                                   );
                                                 }
                                                 },
                                                   future: fetchMemberList(groups[index]),
                                                 ),
                                                       Padding(padding: const EdgeInsets.all(20),


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
                                                                             child: TextField(
                                                                               controller: nameController,
                                                                               decoration: const InputDecoration(
                                                                                 border: OutlineInputBorder(),
                                                                                 labelText: 'User Name',
                                                                               ),
                                                                             ),
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
                                                                                inviteNewUser(nameController.text.toString());
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
                                                     ),

                                                 ), ], ),
                                                 );
                                               });
                                               //initState();
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
                              else if (ConnectionState.none!=null ) {
                                return Text(
                                  'Hello, Join or create a group!',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                );
                              }
                              else if(snapshot.inState(ConnectionState.waiting)!=null){

                                return const Center(

                                  child: CircularProgressIndicator(),
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

                              return const Center(

                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          future: fetchGroupList(),
                        ),


  ),
          const SizedBox(height: 2.0),
        ],

      ),
    );
    //initState();
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
