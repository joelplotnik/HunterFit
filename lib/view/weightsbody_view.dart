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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeightDetails(workout)));
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/${workout.category}.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(.9),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 10,
                    child: Text(
                      workout.category,
                      style: const TextStyle(
                        letterSpacing: 6,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 30,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
