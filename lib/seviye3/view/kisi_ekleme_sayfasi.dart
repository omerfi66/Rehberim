import 'package:bloccc/seviye2/widget/textfieldlar.dart';
import 'package:bloccc/seviye3/view/home_ekrani.dart';
import 'package:bloccc/seviye3/view/kisi_ekle_viewModel.dart';
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
                      Navigator.pop(context); // Ekranı kapat
                      Navigator.pushReplacement(
                        // Yeni ekrana geç, mevcut ekranda refresh yap
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
                        borderRadius:
                            BorderRadius.circular(10), // Köşeleri yuvarlar
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
          ),
          const Flexible(
              flex: 1,
              child: Text(' ! Kaydettikten sonra sayfayi yenileyiniz !'))
        ],
      ),
    );
  }
}
