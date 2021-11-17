import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
class timer extends StatefulWidget {
  timer({Key? key}) : super(key: key);

  @override
  _timerState createState() => _timerState();
}

class _timerState extends State<timer> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 102, 146, 1),
      body: CountdownTimer(
        endTime: endTime,
      ),
    );
  }
}