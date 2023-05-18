import 'package:flutter/material.dart';

class MainPageSafeArea extends StatelessWidget {
  final String text;
  const MainPageSafeArea({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: AlignmentDirectional.centerStart,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.red, width: 0.5))),
      child: Text(
        text,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
    ));
  }
}
