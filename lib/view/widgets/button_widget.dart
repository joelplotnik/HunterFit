import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weights/weights_constants.dart' as constants;

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(primary: constants.kHunterColor),
        onPressed: onClicked,
      );
}
