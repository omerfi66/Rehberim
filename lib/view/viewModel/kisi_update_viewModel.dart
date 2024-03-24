import 'package:bloccc/cubit/get_user_cubit.dart';
import 'package:bloccc/view/kisi_sil_guncelle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin KisiUpdateViewModel on State<KisiSilGuncelle> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> updateClick() async {
    await context.read<GetUserCubit>().updateUsers(
        widget.userModel3.id, nameController.text, numberController.text);
    Navigator.pop(context);
  }

  deleteClick() {
    context.read<GetUserCubit>().deleteUsers(widget.userModel3);
    Navigator.pop(context);
  }
}
