import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  State<GroupsView> createState() => _GroupsViewState();

}

class _GroupsViewState extends State<GroupsView> {
  int segmentedControlGroupValue=0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };

  final List<String> names = <String>['Nicks Group', 'Fitness Fire', 'Athletes & All Stars',  'Greatest Group', ];
  final List<int> memCount = <int>[2, 0, 10, 6, ];
  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
      memCount.insert(0, 0);
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
            onPressed: () {
              addItemToList();
            },
          ),
         Expanded(
             child: ListView.builder(
               padding: const EdgeInsets.all(8),
                 itemCount: names.length,
                 itemBuilder: (BuildContext context, int index) {
                   return Container(
                     height: 75,
                     margin: const EdgeInsets.all(2),
                     color: const Color(0xFF47ABD1),
                     child: Center(
                         child: Text('${names[index]} (${memCount[index]})',
                           style: const TextStyle(fontSize: 18),
                         )
                     ),
                   );
                 }
    )),

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
