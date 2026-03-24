import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? ontap;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final String title;
  const SubmitButton(
      {super.key,
      required this.title,
      this.buttonColor,
      this.width,
      this.height,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: width ?? 50,
        width: height ?? 300,
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.amber,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: TextWidget(
          title: title,
          fontSize: 25,
          boldness: FontWeight.bold,
        )),
      ),
    );
  }
}
