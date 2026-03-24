import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
      child: MessageWidget(
        height: 100, // Set desired height for each card
        width: MediaQuery.of(context).size.width *
            0.7, // Adjust width based on screen
        firstLayer_color: Colors.grey.shade300,
        secondLayer_Color: Colors.blueAccent,
        widget: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                title: "Message Content",
                boldness: FontWeight.bold,
                fontSize: 15,
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Widget? widget;
  final double height;
  final double width;
  final Color? firstLayer_color;
  final Color? secondLayer_Color;
  const MessageWidget({
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
      width: width + 10,
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
