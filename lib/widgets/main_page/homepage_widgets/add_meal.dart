import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/add_food_page.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage_widgets/add_food/search_food/calorie_change.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage_widgets/add_food_button.dart';
import 'package:provider/provider.dart';

import '../../../model/food.dart';

class AddMeal extends StatelessWidget {
  final LunchType lunchType;

  static const routeName = '/AddMeal';
  const AddMeal({
    super.key,
    required this.lunchType,
  });
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Foods>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        border: Border.lerp(null, null, 0),
        trailing: TextButton(
          child: const Text(
            'Done',
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.red, width: 0.5),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              lunchType.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListOfFoodsWidget(
              displayedFoods: lunchType == LunchType.breakfast
                  ? state.brakfastFoods
                  : (lunchType == LunchType.lunch
                      ? state.lunchFoods
                      : (lunchType == LunchType.dinner
                          ? state.dinnerFoods
                          : state.snackFoods)),
              lunchType: lunchType,
            ),
          ),
          SafeArea(
            child: AddFoodButton(
              action: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddFoodPage(lunchType: lunchType),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}






class ListOfFoodsWidget extends StatelessWidget {
  const ListOfFoodsWidget({
    super.key,
    required this.displayedFoods,
    required this.lunchType,
  });

  final List<Food> displayedFoods;
  final LunchType lunchType;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: displayedFoods.isEmpty
            ? [
                Center(
                  child: SvgPicture.asset(Assets.images.breakfastimage),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Add the food you have eaten',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ]
            : displayedFoods
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
                              child: Column(
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
                              ),
                            ),
                            Expanded(
                              child: CalorieChange(food: food),
                            ),
                            Expanded(
                              child: Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () =>
                                      Provider.of<Foods>(context, listen: false)
                                          .removeFood(food, lunchType),
                                  child: SvgPicture.asset(
                                    Assets.icons.eliminate,
                                    // ignore: deprecated_member_use
                                    color: Colors.black,
                                  ),
                                ),
                              ),
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
