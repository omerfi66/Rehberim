import 'package:bloccc/seviye3/model/user_model3.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  var db = Hive.box<UserModel3>('dbuser');
  List<UserModel3> allUsers = [];

// Veri Kaydet
  Future<void> saveUser(String userName, String userNumber) async {
    String userID = const Uuid().v1();

    UserModel3 newUser =
        UserModel3(id: userID, userName: userName, userNumber: userNumber);

    await db.put(userID, newUser);
  }

  // Veri Guncelle
  Future<void> updateUser(
      String userID, String userName, String userNumber) async {
    UserModel3 newUser =
        UserModel3(id: userID, userName: userName, userNumber: userNumber);

    await db.put(userID, newUser);
  }

//Veri Çek
  Future<List<UserModel3>> getUser() async {
    if (db.isNotEmpty) {
      allUsers = db.values.toList();
      return allUsers;
    } else {
      return allUsers;
    }
  }

//Veri Sil
  Future<void> deleteUser(UserModel3 userModel3) async {
    await db.delete(userModel3.id);
  }
}
