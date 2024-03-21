import 'package:bloccc/seviye2/switch_cubit.dart';
import 'package:bloccc/seviye2/user_cubit.dart';
import 'package:bloccc/seviye2/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user home screen'),
      ),
      body: Center(
        child: BlocBuilder<UserCubit, UserModel?>(
          builder: (context, state) {
            var cardColor = context.read<SwitchCubit>().state
                ? Colors.green
                : Colors.orange;
            if (state != null) {
              return Card(
                  color: cardColor,
                  child: ListTile(
                      title: Text(state.name), subtitle: Text(state.password)));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
