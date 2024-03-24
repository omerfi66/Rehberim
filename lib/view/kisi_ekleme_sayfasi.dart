import 'package:bloccc/view/home_ekrani.dart';
import 'package:bloccc/view/viewModel/kisi_ekle_viewModel.dart';
import 'package:bloccc/widget/textfieldlar.dart';
import 'package:flutter/material.dart';

class KisiEklemeSayfasi extends StatefulWidget {
  const KisiEklemeSayfasi({super.key});

  @override
  State<KisiEklemeSayfasi> createState() => _KisiEklemeSayfasiState();
}

class _KisiEklemeSayfasiState extends State<KisiEklemeSayfasi>
    with KisiEkleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kisi ekleme '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    kaydetButonClick();
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeEkran(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: const Size(150, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'KAYDET',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
