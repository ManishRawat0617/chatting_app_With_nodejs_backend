import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final FontWeight? boldness;
  const TextWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
    this.boldness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, color: color, fontWeight: boldness),
    );
  }
}
