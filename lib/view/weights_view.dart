import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// LoginPage is the first screen a user will see upon launching the system
class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 102, 146, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(73, 172, 207, 1),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: "Weight Lifting",
            style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: '\nWhat are you training today?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  // BACK------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Back.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // BICEPS------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Biceps.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // CALVES------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Calves.png'),
                    radius: 50,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  // CHEST------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Chest.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // CORE------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Core.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // GLUTES------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Glutes.png'),
                    radius: 50,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  // SHOULDERS------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Shoulders.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // Triceps------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Triceps.png'),
                    radius: 50,
                  ),
                ),
                ElevatedButton(
                  // Upper Legs------------------------------
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(2),
                    onPrimary: Colors.white,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Upper Legs.png'),
                    radius: 50,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
