import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/widgets/button_widget.dart';
import 'package:hunter_fit/database/getUserData.dart';
import 'package:hunter_fit/database/insertUserData.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  insertUserData insertToDB = insertUserData();
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  format(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  void reset() {
    setState(() => duration = const Duration());
  }

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
              ButtonWidget(
                text: 'SAVE',
                onClicked: () async {
                  await insertToDB.addUserTime(format(duration));
                  print(duration);
                  stopTimer();
                },
              ),
              const SizedBox(width: 12),
              ButtonWidget(
                text: isRunning ? 'STOP' : 'RESUME',
                onClicked: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTimer(resets: false);
                  }
                },
              ),
              const SizedBox(width: 12),
              ButtonWidget(
                text: 'CANCEL',
                onClicked: () {
                  stopTimer();
                },
              ),
            ],
          )
        : ButtonWidget(
            text: 'Start Timer',
            onClicked: () {
              startTimer();
            },
          );
  }
}
