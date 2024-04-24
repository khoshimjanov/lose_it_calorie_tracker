import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../model/food.dart';
import '../../../../../provider/foods.dart';


class AddMealFood extends StatelessWidget {
  const AddMealFood({
    super.key,
    required this.lunchType,
    required this.state,
    required this.food,
  });

  final LunchType lunchType;
  final Foods state;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Provider.of<Foods>(
            context,
            listen: false,
          ).addMealFood(food, lunchType);
        },
        child: Ink(
          child: SvgPicture.asset(
            lunchType == LunchType.breakfast
                ? state.brakfastFoods.contains(food)
                    ? Assets.icons.tickedContainer
                    : Assets.icons.container
                : (lunchType == LunchType.lunch
                    ? state.lunchFoods.contains(food)
                        ? Assets.icons.tickedContainer
                        : Assets.icons.container
                    : (lunchType == LunchType.dinner
                        ? state.dinnerFoods.contains(food)
                            ? Assets.icons.tickedContainer
                            : Assets.icons.container
                        : state.snackFoods.contains(food)
                            ? Assets.icons.tickedContainer
                            : Assets.icons.container)),
          ),
        ),
      ),
    );
  }
}
