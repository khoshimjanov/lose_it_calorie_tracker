import 'package:flutter/material.dart';

import '../../../../../model/food.dart';


class FoodInfo extends StatelessWidget {
  const FoodInfo({
    super.key,    required this.food,

  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            food.name,
            style: const TextStyle(fontSize: 17),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            "${food.totalCalorie()} kcal",
            style: const TextStyle(
              color: Color.fromRGBO(
                125,
                125,
                125,
                1,
              ),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
