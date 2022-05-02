import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/model/database/insertUserData.dart';
import 'package:hunter_fit/view/weights/components/set_card.dart';
import 'package:hunter_fit/constants.dart' as constants;
//import 'package:hunter_fit/view/widgets/weights_stopwatch.dart';

import '../widgets/button_icon_widget.dart';
import '../widgets/button_text_widget.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

int setNumber = 1;
String reps = '';
String lbs = '';

Widget createSetCard() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            setNumber.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: const BoxDecoration(color: constants.kHunterColor),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextField(
          onChanged: (value) {
            reps = value;
          },
          textAlign: TextAlign.center,
          maxLength: 3,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
      Expanded(
        flex: 3,
        child: TextField(
          onChanged: (value) {
            lbs = value;
          },
          textAlign: TextAlign.center,
          maxLength: 3,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            hintText: "lbs",
            suffix: Text("lbs"),
            counterText: "",
            border: InputBorder.none,
            //suffix: Text('lbs'),
          ),
        ),
      ),
    ],
  );
}

insertToDB(String workoutName, String reps, String lbs) async {
  insertUserData insertData = insertUserData();
  await insertData.insertWeightRepAndLbs(workoutName, reps, lbs);
}

class _WeightsViewState extends State<WeightsView> {
  TextEditingController workoutName = TextEditingController();
  List<Widget> _setsList = [];
  void resetData() {}
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
                    controller: workoutName,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter a workout name...',
                      hintStyle: TextStyle(
                        color: Colors.white,
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
                      if (workoutName.text.isNotEmpty && _setsList.isEmpty) {
                        setState(() {
                          _setsList.add(createSetCard());
                          setNumber++;
                        });
                      } else if (workoutName.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarWorkoutName);
                        // } else if (card.lbs.text.isEmpty ||
                        //     card.reps.text.isEmpty) {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(snackBarRepsLbs);
                      } else {
                        openDialog();
                      }
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
            child: stopwatch(),
          )
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) {
          //If workoutName is not empty and the setsLists is not empty
          if (!workoutName.text.isEmpty && _setsList.isNotEmpty) {
            return AlertDialog(
              title: Text('Log Previous Set?'),
              actions: [
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text('YES'),
                  onPressed: () => setState(() {
                    _setsList.add(createSetCard());
                    setNumber++;
                    print(
                        'WORKOUT: ${workoutName.text} \nREPS: $reps + LBS: $lbs');
                    // insertToDB(workoutName.text, reps, lbs);
                    Navigator.pop(context);
                  }),
                )
              ],
            );
          } else {
            return AlertDialog(
              title: Text('ERROR'),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          }
        },
      );

  final snackBarWorkoutName = SnackBar(
    content: const Text('Please enter a workout name...'),
    backgroundColor: Colors.red.shade400,
    duration: Duration(seconds: 2),
  );

  final snackBarRepsLbs = SnackBar(
    content: const Text('Please fill in both sets and reps...'),
  );
  insertUserData insertToDB = insertUserData();
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset() {
    setState(() => duration = const Duration());
  }

  // bool isFinished() {
  //   if (finished == false) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget stopwatch() {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              buildTime(),
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: hours, header: 'HOURS'),
          const SizedBox(
            width: 4,
          ),
          buildTimeCard(time: minutes, header: 'MINUTES'),
          const SizedBox(
            width: 4,
          ),
          buildTimeCard(time: seconds, header: 'SECONDS'),
        ],
      ),
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      FittedBox(
        child: Column(
          children: [
            Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                time,
                style: const TextStyle(
                    fontSize: 43,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            Text(header),
          ],
        ),
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonIconWidget(
                icon: isRunning
                    ? Icons.pause
                    : CupertinoIcons.play_arrow_solid, //PLAY & PAUSE
                color: constants.kHunterColor,
                onClicked: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTimer(resets: false);
                  }
                },
              ),
              const SizedBox(width: 12),
              ButtonTextWidget(
                  text: 'Finish Workout',
                  onClicked: () async {
                    await insertToDB.insertWeightTime(duration);
                    stopTimer();
                    _setsList = [];
                    setNumber = 1;
                    workoutName.clear();
                  }),
              const SizedBox(width: 12),
              ButtonIconWidget(
                icon: CupertinoIcons.arrow_counterclockwise, //CANCEL
                color: constants.kHunterColor,
                onClicked: () {
                  stopTimer();
                  _setsList = [];
                  setNumber = 1;
                  workoutName.clear();
                },
              ),
            ],
          )
        : ButtonTextWidget(
            text: 'Start Workout',
            onClicked: () {
              startTimer();
            },
          );
  }
}
