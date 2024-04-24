import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';


class CaloriIntake extends StatelessWidget {
  const CaloriIntake({
    super.key,
    required this.foods,
  });

  final Foods foods;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your calorie intake today'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 12,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: foods.totalDailyCalorie >= 5000
                ? 1
                : foods.totalDailyCalorie / 5000,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('0'),
            Text(foods.totalDailyCalorie.toString()),
            const Text('5000'),
          ],
        )
      ],
    );
  }
}
