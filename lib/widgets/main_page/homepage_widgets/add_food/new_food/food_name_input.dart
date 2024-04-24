import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/foods.dart';

class FoodNameInput extends StatelessWidget {
  const FoodNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Name'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color:AppColors.inputWidgetColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              onChanged: (value) {
                Provider.of<Foods>(context, listen: false).newFood.name = value;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
