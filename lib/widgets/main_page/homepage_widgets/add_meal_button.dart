import 'package:flutter/material.dart';

import 'package:lose_it_calory_tracker/provider/foods.dart';

import 'add_meal.dart';

class AddMealButton extends StatelessWidget {
  const AddMealButton({
    super.key,
    required this.lunchType,
  });

  final LunchType lunchType;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddMeal(
              lunchType: lunchType,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              'ADD ${lunchType.name.toUpperCase()}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
