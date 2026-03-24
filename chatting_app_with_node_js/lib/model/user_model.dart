import 'package:hive/hive.dart';
part 'user_model.g.dart'; // Generate the adapter later

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String email;

  @HiveField(1)
  String name;

  @HiveField(2)
 String phone;

 @HiveField(3)
 String user_id;

  UserModel({required this.email, required this.name, required this.phone,required this.user_id});
}
