import 'package:bloccc/seviye1/build_text.dart';
import 'package:bloccc/seviye1/giris_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: GirisBuilderText(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<GirisCubit>().arttir();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
              onPressed: () {
                context.read<GirisCubit>().azalt();
              },
              child: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
