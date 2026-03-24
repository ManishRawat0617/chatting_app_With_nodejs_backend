import 'package:chatting_app_with_node_js/model/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<UserModel> userData() => Hive.box<UserModel>('userData');
}
