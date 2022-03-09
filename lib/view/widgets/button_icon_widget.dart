import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weights/weights_constants.dart' as constants;

class ButtonIconWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData icon;

  const ButtonIconWidget({
    Key? key,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        child: Icon(icon),
        style: ElevatedButton.styleFrom(primary: constants.kHunterColor),
        onPressed: onClicked,
      );
}
