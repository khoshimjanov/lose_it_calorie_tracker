import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_breakfast_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_lunch_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/meals_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Auth>(context).person;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: MainPageSafeArea(text: 'Hello,${person!.name}!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your calorie intake today'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.20),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.5,
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
                      Text("${(2200 * 0.8).toInt()}"),
                      const Text('2200'),
                    ],
                  ),
                  const Text('Meals Today'),
                  MealsWidget(
                    mealName: 'Breakfast',
                    calorieContent: '440 average calorie content',
                    addMealText: 'ADD BREAKFAST',
                    gradientColors: const [
                      Color.fromRGBO(241, 127, 161, 1),
                      Color.fromRGBO(218, 176, 126, 1)
                    ],
                    addMeal: () {
                      Navigator.of(context).pushNamed(AddBreakFast.routeName);
                    },
                  ),
                  MealsWidget(
                    mealName: 'Lunch',
                    calorieContent: '549 average calorie content',
                    addMealText: 'ADD LUNCH',
                    gradientColors: const [
                      Color.fromRGBO(68, 153, 99, 1),
                      Color.fromRGBO(121, 199, 183, 1)
                    ],
                    addMeal: () {
                      Navigator.of(context).pushNamed(AddLunch.routeName);
                    },
                  ),
                  MealsWidget(
                    mealName: 'Dinner',
                    calorieContent: '769 average calorie content',
                    addMealText: 'ADD DINNER',
                    gradientColors: const [
                      Color.fromRGBO(110, 154, 214, 1),
                      Color.fromRGBO(156, 176, 214, 1)
                    ],
                    addMeal: () {},
                  ),
                  MealsWidget(
                    mealName: 'Snacks',
                    calorieContent: '440 average calorie content',
                    addMealText: 'ADD SNACK',
                    gradientColors: const [
                      Color.fromRGBO(140, 123, 178, 1),
                      Color.fromRGBO(225, 160, 169, 1)
                    ],
                    addMeal: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
