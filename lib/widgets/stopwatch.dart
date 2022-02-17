import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hunter_fit/widgets/button_widget.dart';
import 'package:hunter_fit/view/database.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  format(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  Future<void> addUserTime() async {
    Database database =
        await Database(); //wait to initialize an instance if Firestore
    var currentUID =
        await database.getCurrentUserID(); //wait to fetch user ID from DB
    var time = format(duration);
    print('Time is : $duration');

    return database
        .workoutCollection //users > UID > workoutData > weightsData >
        .doc(currentUID.toString())
        .collection('workoutData')
        .doc('weightsData')
        .set({
          'DATE HERE': {
            'Time': time,
          }
        })
        .then((value) => print('Time added'))
        .catchError(
            (error) => print('Failed to add time to database becasue: $error'));
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
                  await addUserTime();
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
