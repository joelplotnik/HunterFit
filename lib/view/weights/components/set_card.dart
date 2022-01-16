import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(border: Border.all(), color: const Color(0xFF47ABD1));
}

Widget setCard() {
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
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 33),
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
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 31),
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
