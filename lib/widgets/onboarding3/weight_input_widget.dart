import 'package:flutter/material.dart';

class WeightInput extends StatelessWidget {
  final VoidCallback weightValueChanged;
  final VoidCallback aimWeightValueChanged;
  final String weightText;
  final String aimWeightText;
  final String heightType;
  const WeightInput(
      {super.key,
      required this.weightValueChanged,
      required this.aimWeightValueChanged,
      required this.weightText,
      required this.aimWeightText,
      required this.heightType,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('What is your current weight?'),
          ),
          GestureDetector(
            onTap: weightValueChanged,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weightText,
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
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 30),
            child: Text('How much weight do you want to be?'),
          ),
          GestureDetector(
            onTap: aimWeightValueChanged,
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
                    aimWeightText,
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
