import 'package:flutter/material.dart';

BoxDecoration myBoxDecoration() {
  return const BoxDecoration(color: Color(0xFF47ABD1));
}

class SetCard {
  SetCard(this.setNumber);

  late String reps;
  TextEditingController repsController = TextEditingController();

  int setNumber;
  Widget createSetCard() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              setNumber.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: myBoxDecoration(),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            controller: repsController,
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              hintText: "reps",
              // suffix: Text('reps'),
              counterText: "",
              border: InputBorder.none,
            ),
          ),
        ),
        const Expanded(
          child: Center(child: Text("x")),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              hintText: "lbs",
              suffix: Text("lbs"),
              counterText: "",
              border: InputBorder.none,
              //suffix: Text('lbs'),
            ),
          ),
        ),
      ],
    );
  }
}
