import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  const HomeSearchBar({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text("Search"),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
