import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';

class CalorieInput extends StatelessWidget {
  final String title;
  final Function(String value) action;
  const CalorieInput(this.title, this.action);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text('$title / 100 g '),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.inputWidgetColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please,enter a number';
                  }
                  return null;
                },
                onChanged: (value) => action(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
