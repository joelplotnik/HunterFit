import 'package:flutter/material.dart';



class GroupsView extends StatefulWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];
  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
      msgCount.insert(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Name',
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Add'),
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
                     margin: EdgeInsets.all(2),
                     color: Color(0xFF47ABD1),
                     child: Center(
                         child: Text('${names[index]} (${msgCount[index]})',
                           style: TextStyle(fontSize: 18),
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
