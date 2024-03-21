import 'package:bloccc/seviye3/model/user_model3.dart';
import 'package:bloccc/seviye3/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCubit extends Cubit<List<UserModel3>> {
  GetUserCubit() : super([]);

  var repo = UserRepo();

  getAllUsers() async {
    var item = await repo.getUser();
    emit(item);
  }

  saveUsers(String userName, String userNumber) async {
    await repo.saveUser(userName, userNumber);
  }

  updateUsers(String userID, userName, String userNumber) async {
    await repo.updateUser(userID, userName, userNumber);
    getAllUsers();
  }

  deleteUsers(UserModel3 userModel3) async {
    await repo.deleteUser(userModel3);
    getAllUsers();
  }
}
