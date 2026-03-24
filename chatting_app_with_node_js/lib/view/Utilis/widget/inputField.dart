import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? obscureTextBool;
  final TextEditingController? controller;

  const InputField(
      {super.key,
      required this.title,
      required this.hintText,
      this.obscureTextBool,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureTextBool ?? false,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
