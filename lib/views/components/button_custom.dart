import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});
  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 140,
        height: 40,
        color: color,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
