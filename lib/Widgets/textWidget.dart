// ignore: file_names
import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  final String data;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  FontStyle? fontstyle;

   Textwidget(
      {super.key,
      this.fontstyle,
      required this.data,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        fontStyle: fontstyle,
      ),
    );
  }
}
