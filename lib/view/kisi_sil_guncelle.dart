import 'package:bloccc/model/user_model3.dart';
import 'package:bloccc/view/viewModel/kisi_update_viewModel.dart';
import 'package:bloccc/widget/textfieldlar.dart';
import 'package:flutter/material.dart';

class KisiSilGuncelle extends StatefulWidget {
  final UserModel3 userModel3;
  const KisiSilGuncelle({super.key, required this.userModel3});

  @override
  State<KisiSilGuncelle> createState() => _KisiEklemeSayfasiState();
}

class _KisiEklemeSayfasiState extends State<KisiSilGuncelle>
    with KisiUpdateViewModel {
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
                  updateClick();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  minimumSize: const Size(150, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Köşeleri yuvarlar
                  ),
                ),
                child: const Text(
                  'GÜNCELLE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  deleteClick();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(150, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Köşeleri yuvarlar
                  ),
                ),
                child: const Text(
                  'SİL',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
