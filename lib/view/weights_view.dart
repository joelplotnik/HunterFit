import 'package:flutter/material.dart';
//import 'package:hunter_fit/view/weightlifting.dart';
import 'package:hunter_fit/widgets/countdown_timer.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Column(
          children: [
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
          ],
        ));
  }
}
