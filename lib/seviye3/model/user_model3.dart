import 'package:hive/hive.dart';

part 'user_model3.g.dart';

@HiveType(typeId: 1)
class UserModel3 {
  @HiveField(0)
  String id;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String userNumber;

  UserModel3(
      {required this.id, required this.userName, required this.userNumber});
}
