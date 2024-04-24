import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage_widgets/meals_widget.dart';

import '../../widgets/main_page/homepage_widgets/calorie_intake.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<Foods>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CaloriIntake(foods: foods),
                const Text('Meals Today'),
                ...LunchType.values.map(
                  (e) => MealsWidget(
                    lunchType: e,
                    state: foods,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
