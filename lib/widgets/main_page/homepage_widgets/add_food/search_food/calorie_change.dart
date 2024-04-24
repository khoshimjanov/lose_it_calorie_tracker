import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../model/food.dart';
import '../../../../../provider/foods.dart';
import '../calorie_icon_button.dart';


class CalorieChange extends StatelessWidget {
  const CalorieChange({
    super.key, required this.food,
  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalorieIconButton(
          imageAsset: Assets.icons.remove,
          onTapped: () => Provider.of<Foods>(
            context,
            listen: false,
          ).removeCalorie(food),
        ),
        Text('${food.weight} g'),
        CalorieIconButton(
          imageAsset: Assets.icons.add,
          onTapped: () => Provider.of<Foods>(
            context,
            listen: false,
          ).addCalorie(
            food,
          ),
        ),
      ],
    );
  }
}
