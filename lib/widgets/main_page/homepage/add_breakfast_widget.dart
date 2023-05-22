import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/add_food_page.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_food_button.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/bottom_bar_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';
import 'package:provider/provider.dart';

class AddBreakFast extends StatelessWidget {
  static const routeName = '/addBreakFast';
  const AddBreakFast({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Foods>(context);
    return Scaffold(
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: 0,
        pageController: PageController(),
        action: (value) {},
      ),
      appBar: CupertinoNavigationBar(
        border: Border.lerp(null, null, 0),
        trailing: TextButton(
          child: const Text(
            'Done',
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          const MainPageSafeArea(text: 'Breakfast'),
          Expanded(
            child: ListOfFoodsWidget(state: state),
          ),
          AddFoodButton(
            action: () {
              Navigator.of(context).pushNamed(AddFoodWidget.routeName);
            },
          )
        ],
      ),
    );
  }
}

class ListOfFoodsWidget extends StatelessWidget {
  const ListOfFoodsWidget({
    super.key,
    required this.state,
  });

  final Foods state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: state.brakfastFoods.isEmpty
            ? [
                Center(child: SvgPicture.asset(Assets.images.breakfastimage)),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Add the food you have eaten',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ]
            : state.brakfastFoods
                .map(
                  (
                    food,
                  ) =>
                      Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        leading: SvgPicture.asset(food.imageUrl),
                        title: Text(food.name),
                        subtitle: Text(
                          "${food.totalCalorie()} kcal",
                          style: const TextStyle(
                            color: Color.fromRGBO(125, 125, 125, 1),
                          ),
                        ),
                        trailing: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Provider.of<Foods>(context, listen: false)
                                .removeBreakFastFood(food);
                          },
                          child: SvgPicture.asset(
                            Assets.icons.eliminate,
                            // ignore: deprecated_member_use
                            color: Colors.black,
                          ),
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
