import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weights/components/set_card.dart';
import 'package:hunter_fit/constants.dart' as constants;
import 'workouts_list.dart';
import 'package:hunter_fit/view/widgets/weights_stopwatch.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  WeightsStopwatch stopwatch = WeightsStopwatch();

  final List<Widget> _setsList = [
    Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "1",
              style: const TextStyle(
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
              hintText: "reps",
              // suffix: Text('reps'),
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
        const Expanded(
          child: Center(child: Text("x")),
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
              hintText: "lbs",
              suffix: Text("lbs"),
              counterText: "",
              border: InputBorder.none,
              //suffix: Text('lbs'),
            ),
          ),
        ),
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
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Workout name',
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.transparent,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        SetCard card = SetCard(setNumber);
                        _setsList.add(card.createSetCard());
                        setNumber++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1,
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
