import 'package:chatting_app_with_node_js/config/routes/routes.dart';
import 'package:chatting_app_with_node_js/view/auth/login/login_screen.dart';
import 'package:chatting_app_with_node_js/view/auth/signUp/signUp_screen.dart';
import 'package:chatting_app_with_node_js/view/bottomNav.dart/bottomNav_Screen.dart';
import 'package:chatting_app_with_node_js/view/chatting_screen/chat_screen.dart';
import 'package:chatting_app_with_node_js/view/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.bottomNavScreen:
        return MaterialPageRoute(builder: (context) => BottomNavScreen());
      case RoutesName.userProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const UserProfileScreen());
      case RoutesName.chatScreen:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route generated"),
            ),
          );
        });
    }
  }
}
