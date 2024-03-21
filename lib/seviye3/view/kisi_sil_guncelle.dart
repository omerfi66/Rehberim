import 'package:bloccc/seviye2/widget/textfieldlar.dart';
import 'package:bloccc/seviye3/cubit/get_user_cubit.dart';
import 'package:bloccc/seviye3/model/user_model3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiSilGuncelle extends StatefulWidget {
  final UserModel3 userModel3;
  const KisiSilGuncelle({super.key, required this.userModel3});

  @override
  State<KisiSilGuncelle> createState() => _KisiEklemeSayfasiState();
}

class _KisiEklemeSayfasiState extends State<KisiSilGuncelle> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel3.userName;
    numberController.text = widget.userModel3.userNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kisi duzenle'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldlar(controller: nameController, label: 'isim - soyisim'),
          TextFieldlar(
            controller: numberController,
            label: 'numara',
            klavyeNumber: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<GetUserCubit>().updateUsers(
                        widget.userModel3.id,
                        nameController.text,
                        numberController.text);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const HomeEkran(),
                    //     ));
                    Navigator.pop(context);
                  },
                  child: const Text('Guncelle')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade100),
                  onPressed: () {
                    context.read<GetUserCubit>().deleteUsers(widget.userModel3);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const HomeEkran(),
                    //     ));
                    Navigator.pop(context);
                  },
                  child: const Text('sil')),
            ],
          )
        ],
      )),
    );
  }
}
