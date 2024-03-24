import 'package:bloccc/seviye3/cubit/get_user_cubit.dart';
import 'package:bloccc/seviye3/view/kisi_ekleme_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin KisiEkleViewModel on State<KisiEklemeSayfasi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> kaydetButonClick() async {
    await context.read<GetUserCubit>().saveUsers(
          nameController.text,
          numberController.text.toString(),
        );
  }
}
