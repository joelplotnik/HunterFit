import 'package:flutter/material.dart';
//import 'package:hunter_fit/view/weightlifting.dart';
//import 'package:hunter_fit/widgets/countdown_timer.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  final List<Widget> _setsList = [];
  int number = 1;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(border: Border.all(), color: const Color(0xFF47ABD1));
  }


  Widget _setCard2() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            alignment: Alignment.center,
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: myBoxDecoration(),
          ),
        ),
        const Expanded(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 33),
              hintText: "Reps",
              suffix: Text('reps'),
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            "X",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 31),
              hintText: "Weight",
              counterText: "",
              border: InputBorder.none,
              suffix: Text('lbs'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: const Alignment(-.9, -.1),
            child: const Text(
              "Barbell Bench press",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            color: const Color(0xFF47ABD1),
            height: 50,
          ),
          const Divider(
            color: Colors.black87,
            height: 2,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _setsList.length,
              itemBuilder: (context, index) {
                return _setsList[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF47ABD1),
        elevation: 7,
        onPressed: () {
          setState(() {
            _setsList.add(_setCard2());
          });
        },
      ),
    );
  }
}
