import 'package:bloccc/seviye3/cubit/get_user_cubit.dart';
import 'package:bloccc/seviye3/view/kisi_ekleme_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin KisiEkleViewModel on State<KisiEklemeSayfasi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

// //  Bu sayfa da yok ama olsa init state de buraya konabilirdi
//   @override
//   void initState() {
//     super.initState();
//   }

  kaydetButonClick() {
    context
        .read<GetUserCubit>()
        .saveUsers(nameController.text, numberController.text.toString());

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const HomeEkran(),
    //     ));
    Navigator.pop(context);
  }
}
