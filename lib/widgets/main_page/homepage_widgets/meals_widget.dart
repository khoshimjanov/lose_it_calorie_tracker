import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';

import 'add_meal_button.dart';

class MealsWidget extends StatelessWidget {
  final LunchType lunchType;
  final Foods state;

  const MealsWidget({
    super.key,
    required this.lunchType,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    int calorieContent = 0;

    switch (lunchType) {
      case LunchType.breakfast:
        calorieContent = state.totalBreakfastCalorie;

        break;
      case LunchType.lunch:
        calorieContent = state.totalLunchCalorie;

        break;
      case LunchType.dinner:
        calorieContent = state.totalDinnerCalorie;

        break;
      case LunchType.snacks:
        calorieContent = calorieContent = state.totalSnacksCalorie;

        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.mealsGradients(lunchType),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lunchType.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.icons.moreVert),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$calorieContent average calorie content',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AddMealButton(lunchType: lunchType),
          )
        ],
      ),
    );
  }
}
