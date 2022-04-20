import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/model/database/insertUserData.dart';
import 'package:hunter_fit/view/widgets/button_text_widget.dart';
import 'package:hunter_fit/constants.dart' as constant;
import 'package:hunter_fit/view/weights/weights_view.dart';

import '../weights/weights_functions.dart';
import 'button_icon_widget.dart';

class WeightsStopwatch extends StatefulWidget {
  const WeightsStopwatch({Key? key}) : super(key: key);

  @override
  _WeightsStopwatchState createState() => _WeightsStopwatchState();
}

class _WeightsStopwatchState extends State<WeightsStopwatch> {
  WeightsView weightsView = new WeightsView();
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
  Widget build(BuildContext context) {
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
                color: constant.kHunterColor,
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
                  }),
              const SizedBox(width: 12),
              ButtonIconWidget(
                icon: CupertinoIcons.arrow_counterclockwise, //CANCEL
                color: constant.kHunterColor,
                onClicked: () {
                  stopTimer();
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
