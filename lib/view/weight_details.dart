import 'package:flutter/material.dart';
import 'package:hunter_fit/model/workouts_model.dart';

class WeightDetails extends StatelessWidget {
  final Workout workout;
  WeightDetails(this.workout);

  Widget buildWorkoutCard(String text, String img) {
    return Align(
      child: Card(
        child: Stack(
          children: [
            Ink.image(
              image: AssetImage('assets/images/$img.jpeg'),
              height: 180,
              width: 400,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  print('Hello');
                },
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.category),
      ),
      body: ListWheelScrollView(
        itemExtent: 100,
        children: [
          Align(
            child: Card(
              child: Stack(
                children: [
                  Ink.image(
                    image: AssetImage('assets/images/Chest.jpeg'),
                    height: 180,
                    width: 400,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                  Text(
                    workout.workout,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
