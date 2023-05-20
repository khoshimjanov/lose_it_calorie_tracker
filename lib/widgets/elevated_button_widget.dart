import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback action;
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 50),
        padding: EdgeInsets.zero,
        shape: const StadiumBorder(),
      ),
      onPressed: action,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(252, 90, 68, 1),
              Color.fromRGBO(196, 20, 50, 1)
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
