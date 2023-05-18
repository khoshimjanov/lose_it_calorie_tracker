import 'package:flutter/material.dart';

class AddFoodButton extends StatelessWidget {
  final VoidCallback action;
  const AddFoodButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: action,
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 223, 30, 16)),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                'ADD FOOD',
                style: TextStyle(
                    color: Color.fromARGB(255, 196, 40, 28), fontSize: 17),
              ),
            ),
          )),
    );
  }
}
