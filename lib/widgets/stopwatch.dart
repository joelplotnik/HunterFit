import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hunter_fit/widgets/button_widget.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset() {
    setState(() => duration = Duration());
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  addTime() {
    final addSeconds = 1;

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
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: hours, header: 'HOURS'),
          const SizedBox(
            width: 8,
          ),
          buildTimeCard(time: minutes, header: 'MINUTES'),
          const SizedBox(
            width: 8,
          ),
          buildTimeCard(time: seconds, header: 'SECONDS'),
        ],
      ),
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                time,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(header),
        ],
      );
  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
            ),
          )
        : ButtonWidget(
            text: 'Start Timer',
            onClicked: () {
              startTimer();
            },
          );
  }
}
