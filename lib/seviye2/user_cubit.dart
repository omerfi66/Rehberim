import 'package:bloccc/seviye2/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  UserKaydet(UserModel userModel) {
    emit(userModel);
  }
}
