import 'package:bloccc/seviye2/switch_cubit.dart';
import 'package:bloccc/seviye2/user_cubit.dart';
import 'package:bloccc/seviye2/user_home_screen.dart';
import 'package:bloccc/seviye2/user_model.dart';
import 'package:bloccc/seviye2/widget/textfieldlar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEkrani extends StatefulWidget {
  const LoginEkrani({super.key});

  @override
  State<LoginEkrani> createState() => _LloginEkraniState();
}

class _LloginEkraniState extends State<LoginEkrani> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  var deger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('seviye 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldlar(controller: nameController, label: 'name'),
          TextFieldlar(controller: passworController, label: 'pasword'),
          BlocBuilder<SwitchCubit, bool>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  state ? const Text('admin') : const Text('person'),
                  Switch(
                      value: state,
                      onChanged: (value) {
                        context.read<SwitchCubit>().durumDegirstir();
                      }),
                ],
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    passworController.text.isNotEmpty) {
                  var usermodel = UserModel(
                      name: nameController.text,
                      password: passworController.text);

                  context.read<UserCubit>().UserKaydet(usermodel);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserHomeScreen(),
                      ));
                } else {}
              },
              child: const Text('keydet'))
        ],
      )),
    );
  }
}
