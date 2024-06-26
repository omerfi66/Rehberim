import 'package:alphabet_slider/alphabet_slider.dart';
import 'package:bloccc/cubit/get_user_cubit.dart';
import 'package:bloccc/model/user_model3.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'kisi_ekleme_sayfasi.dart';
import 'kisi_sil_guncelle.dart';

class HomeEkran extends StatefulWidget {
  const HomeEkran({super.key});

  @override
  State<HomeEkran> createState() => _HomeEkranState();
}

class _HomeEkranState extends State<HomeEkran> {
  @override
  void initState() {
    super.initState();
    _getContacts().then((_) {
      context.read<GetUserCubit>().getAllUsers();
    });
  }

  Future<void> _getContacts() async {
    final Box<bool> settingsBox = await Hive.openBox<bool>('settings');
    final bool contactsLoaded = settingsBox.get('contactsLoaded') ?? false;

    if (!contactsLoaded) {
      final Iterable<Contact> contacts = await ContactsService.getContacts();
      final List<UserModel3> deviceContacts = contacts.map((contact) {
        return UserModel3(
          id: contact.identifier ?? '',
          userName: contact.displayName ?? '',
          userNumber: contact.phones!.isNotEmpty
              ? contact.phones?.first.value ?? ''
              : '',
        );
      }).toList();

      for (final contact in deviceContacts) {
        await context
            .read<GetUserCubit>()
            .saveUsers(contact.userName, contact.userNumber);
      }

      await settingsBox.put('contactsLoaded', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kisiler'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            //context.read<GetUserCubit>().getAllUsers();
            _getContacts().then((_) {
              context.read<GetUserCubit>().getAllUsers();
            });
          },
          child: Center(
            child: BlocBuilder<GetUserCubit, List<UserModel3>>(
              builder: (context, state) {
                state.sort((a, b) => a.userName
                    .toLowerCase()
                    .compareTo(b.userName.toLowerCase()));
                if (state.isNotEmpty) {
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ListView.builder(
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          UserModel3 item = state[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 28, left: 8),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                  color: Colors.deepPurpleAccent,
                                  width: 1.0,
                                ),
                              ),
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            KisiSilGuncelle(userModel3: item)),
                                  );
                                },
                                leading: const Icon(Icons.person),
                                title: Text(
                                  item.userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Text('-${item.userNumber}'),
                                trailing: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      AlphabetSlider(
                        onLetterSelect: _onLetterSelect,
                        textColor: Colors.deepPurpleAccent,
                        fontSize: 12,
                      )
                    ],
                  );
                } else {
                  return const Text('Goruntulenecek kisi yok');
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KisiEklemeSayfasi(),
                ));
          },
          child: const Icon(
            Icons.group_add_outlined,
            color: Colors.white,
          ),
        ));
  }

  void _onLetterSelect(String letter) {
    final List<UserModel3> users = context.read<GetUserCubit>().state;
    final index = users.indexWhere(
        (user) => user.userName.toLowerCase().startsWith(letter.toLowerCase()));
    if (index != -1) {
      final ScrollController controller = PrimaryScrollController.of(context);
      const double itemExtent = 80; // ListTile height
      controller.jumpTo(index * itemExtent);
    }
  }
}
