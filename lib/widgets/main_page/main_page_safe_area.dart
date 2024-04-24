import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageSafeArea extends StatelessWidget {
  final String text;
  const MainPageSafeArea({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
        leading: Text(
          text,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        border: const Border.symmetric(
          horizontal: BorderSide(color: Colors.red),
        ),
      );
  }
}
