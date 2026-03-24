import 'package:chatting_app_with_node_js/data/local_storage/boxes.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class Profile_Card extends StatelessWidget {
  final double height;
  final double width;
  final Color? firstLayer_color;
  final Color? secondLayer_Color;
  const Profile_Card({
    super.key,
    this.firstLayer_color,
    this.secondLayer_Color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userBox = Boxes.userData();
    final currentUser = userBox.get("currentUser");
    return Container(
      // color: COlors,
      height: height,
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
              height: height - 20, // Height of the background
            ),
          ),
          Positioned(
            // top: screenHeight * 0.025,
            // left: screenWidth * 0.048,
            top: 7,
            left: 7,
            child: Container(
              width: width, // Width of the background
              height: height * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid, width: 2),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      title: currentUser!.user_id,
                      boldness: FontWeight.bold,
                      fontSize: 16,
                    ),
                    TextWidget(
                      title: currentUser!.name,
                      boldness: FontWeight.bold,
                      fontSize: 25,
                    ),
                    TextWidget(
                      title: currentUser.email,
                      boldness: FontWeight.bold,
                      fontSize: 20,
                    ),
                    TextWidget(
                      title: currentUser.phone,
                      boldness: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ), 
    );
  }
}
