import 'package:flutter/material.dart';
import 'package:hunter_fit/model/workouts_model.dart';
import 'package:hunter_fit/view/weight_details.dart';

class WeightsBodyView extends StatelessWidget {
  const WeightsBodyView({Key? key}) : super(key: key);

  Widget buildCategoryCard(String text, String category) {
    return Align(
      child: Card(
        child: Stack(
          children: [
            Ink.image(
              image: AssetImage('assets/images/$category.jpeg'),
              height: 180,
              width: 400,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {},
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
      body: ListView.builder(
        itemCount: workoutList.length,
        itemBuilder: (context, index) {
          Workout workout = workoutList[index];
          return Card(
            child: ListTile(
                title: Text(workout.category),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeightDetails(workout)));
                }),
          );
        },
      ),
    );
  }
}
