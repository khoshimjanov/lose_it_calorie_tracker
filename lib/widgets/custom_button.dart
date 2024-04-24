import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  const CustomButton({
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
            colors: AppColors.buttonGradient,
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
