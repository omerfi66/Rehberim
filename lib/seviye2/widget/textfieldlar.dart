import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldlar extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  bool klavyeNumber;
  TextFieldlar(
      {super.key,
      required this.controller,
      required this.label,
      this.klavyeNumber = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType:
            klavyeNumber ? TextInputType.number : TextInputType.multiline,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(label)),
      ),
    );
  }
}
