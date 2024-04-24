import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_styles.dart';

import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:lose_it_calory_tracker/widgets/custom_button.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage_widgets/add_food/new_food/calorie_input.dart';
import 'package:provider/provider.dart';

import 'food_name_input.dart';
import 'newfood_image.dart';

class AddNewFood extends StatelessWidget {
  const AddNewFood({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Foods>(context);
    final newFood = Provider.of<Foods>(context).newFood;
    final stateChange = Provider.of<Foods>(context, listen: false).newFood;
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height * 0.9,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: Text('')),
                  const Expanded(
                    flex: 4,
                    child: Align(
                      child: Text(
                        'New Food',
                        style: AppStyles.titleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Fill in the fields to add a product to the list',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            const FoodNameInput(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: CalorieInput(
                      'Kcal',
                      (value) {
                        stateChange.kcal = int.parse(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: CalorieInput(
                      'Protein',
                      (value) {
                        stateChange.protein = int.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: CalorieInput(
                      'Fat',
                      (value) {
                        stateChange.fat = int.parse(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: CalorieInput(
                      'Carbs',
                      (value) {
                        stateChange.carb = int.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Choose an icon for the new product',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            NewFoodImage(
              state: state.foods,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                text: 'CREATE',
                action: () {
                  if (newFood.carb == 0 ||
                      newFood.fat == 0 ||
                      newFood.kcal == 0 ||
                      newFood.protein == 0 ||
                      newFood.name.isEmpty ||
                      newFood.name == '') {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        actions: [
                          CupertinoButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          )
                        ],
                        title: const Text(
                          'Please, fill all the forms!',
                          style: AppStyles.simpleTextStyle,
                        ),
                      ),
                    );
                    return;
                  }
                  Provider.of<Foods>(context, listen: false).addNewFood();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
