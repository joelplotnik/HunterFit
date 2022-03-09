import 'package:flutter/material.dart';
import 'package:hunter_fit/constants.dart' as constants;

class ButtonIconWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData icon;
  final Color color;

  const ButtonIconWidget({
    Key? key,
    required this.icon,
    required this.onClicked,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
        style: ElevatedButton.styleFrom(primary: Colors.transparent),
        onPressed: onClicked,
      );
}
