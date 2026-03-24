import 'package:chatting_app_with_node_js/config/routes/routes.dart';
import 'package:chatting_app_with_node_js/view/Utilis/widget/submitButton.dart';
import 'package:chatting_app_with_node_js/view/reciever_profile/widget/profile_Card.dart';
import 'package:chatting_app_with_node_js/view/user_profile/widget/setting_widget.dart';
import 'package:flutter/material.dart';

class RecieverProfileScreen extends StatefulWidget {
  const RecieverProfileScreen({super.key});

  @override
  State<RecieverProfileScreen> createState() => _RecieverProfileScreenState();
}

class _RecieverProfileScreenState extends State<RecieverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double gapBtwCards = 12;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Profile_Card(height: 300, width: screenWidth * 0.9),
                const SizedBox(
                  height: gapBtwCards,
                ),
                const SettingWidget(
                    title: "Info",
                    icon: Icon(
                      Icons.update,
                      size: 30,
                    )),
                const SizedBox(
                  height: gapBtwCards,
                ),
                const SizedBox(
                  height: 50,
                ),
                SubmitButton(
                  ontap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.chatScreen, (route) => false);
                  },
                  title: "Bock",
                  buttonColor: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
