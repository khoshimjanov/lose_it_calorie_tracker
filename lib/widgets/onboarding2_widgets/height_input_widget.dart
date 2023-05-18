import 'package:flutter/material.dart';

class HeightInput extends StatelessWidget {
  final VoidCallback action;
  final String text;
  final String heightType;
  const HeightInput(
      {super.key,
      required this.action,
      required this.text,
      required this.heightType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text('How tall are you?'),
          ),
          GestureDetector(
            onTap: action,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    heightType,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
