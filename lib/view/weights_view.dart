import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/viewmodel/weights_viewmodel.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  bool isSelected = false;
  static const String test = 'Title';

  @override
  Widget build(BuildContext context) {
    final weightsViewModel = WeightsViewModel();

    void toggleSelected() {
      if (isSelected) {
        isSelected = false;
      } else {
        isSelected = true;
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 102, 146, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 172, 207, 1),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: ("Weight Lifting" + test),
            style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: '\nSelect a muscle group(s)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'MAJOR MUSCLE GROUPS',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.blueGrey.shade900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
            child: Divider(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    // BACK------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Back.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // CHEST------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Chest.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Chest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // SHOULDERS------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Shoulders.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Shoulders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    // BICEPS------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Biceps.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Biceps',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // CORE------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Core.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Core',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // TRICEPS------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Triceps.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Triceps',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    // CALVES------------------------------
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary:
                          isSelected ? Colors.pink.shade400 : Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Calves.png'),
                      radius: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        toggleSelected();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Calves',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // GLUTES------------------------------
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary:
                          isSelected ? Colors.pink.shade400 : Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Glutes.png'),
                      radius: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        toggleSelected();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Glutes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // UPPER LEGS------------------------------
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(4),
                      primary: Colors.blueAccent,
                      onPrimary: Colors.black,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/Upper Legs.png'),
                      radius: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Upper Legs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'MINOR MUSCLE GROUPS',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.blueGrey.shade900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
