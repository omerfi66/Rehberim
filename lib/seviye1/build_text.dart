import 'package:bloccc/seviye1/giris_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisBuilderText extends StatelessWidget {
  const GirisBuilderText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GirisCubit, int>(
      builder: (context, state) {
        return Text(
          state.toString(),
          style: const TextStyle(fontSize: 30),
        );
      },
    );
  }
}
