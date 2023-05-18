import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';

class MealsWidget extends StatelessWidget {
  final String mealName;
  final String calorieContent;
  final String addMealText;
  final List<Color> gradientColors;
  final VoidCallback addMeal;

  const MealsWidget({
    super.key,
    required this.mealName,
    required this.calorieContent,
    required this.addMealText,
    required this.gradientColors,
    required this.addMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mealName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.icons.moreVert),
              )
            ],
          ),
          Text(
            calorieContent,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: addMeal,
              child: Ink(
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    addMealText,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
