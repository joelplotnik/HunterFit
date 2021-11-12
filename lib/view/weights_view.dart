import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weightsbody_view.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:hunter_fit/viewmodel/weights_viewmodel.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white70,
     // appBar: buildAppBar(),
      body: WeightsBodyView(),
    );
  }
/*
  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Categories',
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
      backgroundColor: Colors.white54,
      elevation: 5,
    );
  }*/
}
