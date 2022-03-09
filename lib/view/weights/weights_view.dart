import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weights/components/set_card.dart';
import 'package:hunter_fit/view/weights/weights_constants.dart' as constants;
import 'workouts_list.dart';
import 'package:hunter_fit/view/widgets/stopwatch.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  Stopwatch stopwatch = const Stopwatch();

  final List<Widget> _setsList = [
    Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            alignment: Alignment.center,
            child: const Text(
              "1",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: myBoxDecoration(),
          ),
        ),
        const Expanded(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              hintText: "0",
              suffix: Text('reps'),
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              hintText: "0",
              counterText: "",
              border: InputBorder.none,
              suffix: Text('lbs'),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
  ];
  int setNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Container(
            height: 55,
            color: constants.kHunterColor,
            alignment: const Alignment(-.9, -.1),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Barbell Bench press",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Expanded(
                  child: const SizedBox(
                    width: double.infinity,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashColor: Colors.white,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      icon: const Icon(
                        Icons.fitness_center,
                        size: 40,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutsList(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _setsList.length,
              itemBuilder: (context, index) {
                return _setsList[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.black38,
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
            thickness: 1,
          ),
          Container(
            color: Colors.grey.shade300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: constants.kHunterColor,
                  ),
                  onPressed: () {
                    setState(() {
                      SetCard card = SetCard(setNumber);
                      _setsList.add(card.createSetCard());
                      setNumber++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Set'),
                ),
              ],
            ),
          ),
          Expanded(
            child: stopwatch,
          )
        ],
      ),
    );
  }
}
// Row(
// children: [
// Expanded(
// child: Container(
// height: 65,
// width: 130,
// decoration: constants.kWeightsDataBoxDecoration,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// "Total Reps",
// style: constants.kWeightsDataTitle,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: const [
// Text(
// '58',
// style: constants.kWeightsData,
// ),
// Text('reps'),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: 65,
// width: 130,
// decoration: constants.kWeightsDataBoxDecoration,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// "Total Weight",
// style: constants.kWeightsDataTitle,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: const [
// Text(
// '40',
// style: constants.kWeightsData,
// ),
// Text('lbs'),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// child: Container(
// height: 65,
// width: 130,
// decoration: constants.kWeightsDataBoxDecoration,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// "Average Weight",
// style: constants.kWeightsDataTitle,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.baseline,
// textBaseline: TextBaseline.alphabetic,
// children: const [
// Text(
// '85.8',
// style: constants.kWeightsData,
// ),
// Text('lbs'),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
