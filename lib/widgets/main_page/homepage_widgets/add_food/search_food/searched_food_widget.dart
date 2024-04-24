import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../provider/foods.dart';
import 'add_meal_food.dart';
import 'calorie_change.dart';
import 'food_info.dart';

class SearchedFoodsWidget extends StatelessWidget {
  const SearchedFoodsWidget({
    super.key,
    required this.state,
    required this.lunchType,
  });

  final LunchType lunchType;
  final Foods state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: state.searchedFood
            .map(
              (
                food,
              ) =>
                  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(food.imageUrl),
                        ),
                        Expanded(
                          child: FoodInfo(food: food),
                        ),
                        Expanded(
                          child:  CalorieChange(food: food),
                        ),
                        Expanded(
                          child: AddMealFood(
                              lunchType: lunchType, state: state, food: food,),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 30,
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
