import 'package:bloccc/seviye2/widget/textfieldlar.dart';
import 'package:bloccc/seviye3/view/kisi_ekle_viewModel.dart';
import 'package:flutter/material.dart';

class KisiEklemeSayfasi extends StatefulWidget {
  const KisiEklemeSayfasi({super.key});

  @override
  State<KisiEklemeSayfasi> createState() => _KisiEklemeSayfasiState();
}

class _KisiEklemeSayfasiState extends State<KisiEklemeSayfasi>
    with KisiEkleViewModel {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kisi ekleme '),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 12,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldlar(
                      controller: nameController, label: 'isim - soyisim'),
                  TextFieldlar(
                    controller: numberController,
                    label: 'numara',
                    klavyeNumber: true,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        kaydetButonClick();
                        // context.read<GetUserCubit>().saveUsers(
                        //     nameController.text, numberController.text.toString());

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const HomeEkran(),
                        //     ));
                      },
                      child: const Text('Kaydet')),
                ],
              ),
            ),
          ),
          const Flexible(
              flex: 1,
              child: Text(' ! Kaydettikten sonra sayfayi yenileyiniz !'))
        ],
      ),
    );
  }
}
