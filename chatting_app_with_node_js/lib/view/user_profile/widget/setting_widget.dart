import 'package:chatting_app_with_node_js/view/Utilis/widget/3dWidget.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/textWidget.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  const SettingWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card_3D(
      height: 100,
      width: screenWidth * 0.9,
      widget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            TextWidget(
              title: title,
              boldness: FontWeight.w500,
              fontSize: 25,
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
