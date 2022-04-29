import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hunter_fit/viewmodel/provider/location_provider.dart';
import 'package:hunter_fit/view/widgets/button_text_widget.dart';
import '../../viewmodel/provider/distance_tracker.dart';
import '../../viewmodel/provider/location_provider.dart';

class CardioStopwatch extends StatefulWidget {
  const CardioStopwatch({Key? key}) : super(key: key);

  @override
  _CardioStopwatchState createState() => _CardioStopwatchState();
}

class _CardioStopwatchState extends State<CardioStopwatch> {
  Duration duration = const Duration();
  Timer? timer;
  DistanceTracker distanceTracker = DistanceTracker();

  late LocationProvider locProv;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset() {
    setState(() => duration = const Duration());
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    /*
    - Create singleton that has a public property on it that
    is called isTrackingDistance
    - Instantiate the singleton in the cardio_stopwatch widget
    - When user clicks start on stopwatch, set the singletons property
    to true
    - In the location provider instantiate the same singleton
     */

    //use the singleton to tell the distance tracker to clear the list of location when the start button is clickedgit pull
    distanceTracker.clearLocations();

    distanceTracker.isStopWatchRunning = true;

    // !!!! When someones starts the timer call the clearLocations method in distanceTracker

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    reset();

    //LocationProvider._distanceTraveledMilesVar = 0.0;

    distanceTracker.isStopWatchRunning = false;
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

    return Row(
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
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: const TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
          Text(header),
        ],
      );
  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTextWidget(
                text: isRunning ? 'STOP' : 'START',
                onClicked: () {
                  if (isRunning) {
                    stopTimer(resets: false);
                  } else {
                    startTimer(resets: false);
                  }
                },
              ),
              const SizedBox(width: 12),
              /*ButtonTextWidget(
                text: 'CANCEL',
                onClicked: () {
                  print("STOP GETTING USER POSITION");
                  stopTimer();
                },
              ),*/
            ],
          )
        : ButtonTextWidget(
            text: 'Start Timer',
            onClicked: () {
              startTimer();
            },
          );
  }
}
