import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/constants.dart' as constants;

class WorkoutsList extends StatefulWidget {
  const WorkoutsList({Key? key}) : super(key: key);

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constants.kHunterColor,
        title: Text('WORKOUTS'),
      ),
      body: Column(
        children: [
          Text("hi"),
        ],
      ),
    );
  }
}
