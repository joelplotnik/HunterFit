import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hunter_fit/viewmodel/signup_form.dart';

// LoginPage is the first screen a user will see upon launching the system
class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weights'),
      ),
      body: const Center(
        child: Text('Hello World i like apple'),
      ),
    );
  }
}
