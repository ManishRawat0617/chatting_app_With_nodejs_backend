import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class Card_3D extends StatelessWidget {
  final Widget? widget;
  final double height;
  final double width;
  final Color? firstLayer_color;
  final Color? secondLayer_Color;
  const Card_3D({
    super.key,
    this.firstLayer_color,
    this.secondLayer_Color,
    required this.height,
    required this.width,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: height - 15,
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            // top: screenHeight * 0.012, // Slight offset to create the 3D effect
            // left: screenWidth * 0.018,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid, width: 2),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              width: width - 10, // Width of the background
              height: height - 25, // Height of the background
            ),
          ),
          Positioned(
            // top: screenHeight * 0.025,
            // left: screenWidth * 0.048,
            top: 7,
            left: 7,
            child: Container(
                width: width, // Width of the background
                height: height * 0.75,
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid, width: 2),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: widget),
          )
        ],
      ),
    );
  }
}
