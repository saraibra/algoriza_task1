import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = accentColor,
      this.textColor = Colors.white,
      this.height = 40,
      this.radius = 10,
      this.width = double.infinity})
      : super(key: key);
  final String text;
  Color color;
  Color textColor;
  double width;
  double height;
  double radius;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        height: height,
        onPressed: onPressed,
        textColor: textColor,
        child: Text(text),
      ),
    );
  }
}
