import 'package:flutter/material.dart';

class Workout {
  String category;
  String name1, name2;

  Workout({
    required this.name1,
    required this.name2,
    required this.category,
  });
}

List<Workout> workoutList = [
  Workout(
    category: 'Biceps',
    name1: 'Bicep Curls',
    name2: 'Guitar Solo',
  ),
  Workout(
    category: 'Chest',
    name1: 'Barbell Flat Bench Press',
    name2: 'Barbell Incline Bench Press',
  ),
  Workout(
    category: 'Core',
    name1: 'Sit-ups',
    name2: 'Mountain Climbers',
  )
];
