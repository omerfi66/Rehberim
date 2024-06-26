import 'package:bloccc/cubit/get_user_cubit.dart';
import 'package:bloccc/model/user_model3.dart';
import 'package:bloccc/view/home_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModel3Adapter());
  await Hive.openBox<UserModel3>('dbuser');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GetUserCubit>(
            create: (BuildContext context) => GetUserCubit(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rehberim',
          home: HomeEkran(),
        ));
  }
}
