import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter_fit/view/button_widget.dart';

//

/// This is the stateful widget that the main application instantiates.
class Weightlifting extends StatefulWidget {
  const Weightlifting({Key? key}) : super(key: key);

  @override
  State<Weightlifting> createState() => weightlifting();
}

class weightlifting extends State<Weightlifting> {
  Duration duration = const Duration(hours: 0, minutes: 0, seconds: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimePicker(),
            TextButton.icon(
              icon: Icon(Icons.more_time),
              label: Text('Select A Time'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildTimePicker() {
    return CupertinoTimerPicker(
      initialTimerDuration: duration,
      mode: CupertinoTimerPickerMode.hms,
      onTimerDurationChanged: (duration) => setState(
        () {
          this.duration = duration;
        },
      ),
    );
  }
}
