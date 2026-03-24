import 'package:chatting_app_with_node_js/data/local_storage/boxes.dart';
import 'package:chatting_app_with_node_js/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatting_app_with_node_js/bloc/signup/signup_bloc.dart';
import 'package:chatting_app_with_node_js/config/routes/routes.dart';
import 'package:chatting_app_with_node_js/config/routes/routes_name.dart';
import 'package:chatting_app_with_node_js/services/socket.io.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart'; // Missing import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userData');

  final currentUser = Boxes.userData().get('currentUser');
  // SocketService()
  //     .connect(currentUser!.user_id ?? "user", 'http://192.168.1.6:6000');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.signUpScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
