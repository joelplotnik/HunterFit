import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weightlifting.dart';
import 'package:hunter_fit/widgets/countdown_timer.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: countdown_timer(),
    );
  }
}
