import 'package:flutter/material.dart';

class Workout {
  String category;
  String workout;

  Workout({
    required this.workout,
    required this.category,
  });
}

List<Workout> workoutList = [
  Workout(category: 'Arms', workout: 'Bicep Curls'),
  Workout(category: 'Chest', workout: 'Barbell Bench Press'),
];
