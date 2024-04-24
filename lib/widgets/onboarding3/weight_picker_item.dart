import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';

class WeightPickerItem extends StatelessWidget {
  final int valuelength;
  final int addedvalue;
  final String text;
  final Function(int value) action;
  const WeightPickerItem({
    super.key,
    required this.valuelength,
    required this.addedvalue,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoPicker(
        selectionOverlay: Container(
          padding: const EdgeInsets.only(right: 10,
           
              ),
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(width: 0.3, color: Colors.grey),),),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 23, color:AppColors.greyColor),
          ),
        ),
        itemExtent: 50,
        onSelectedItemChanged: action,
        children: List.generate(
          valuelength,
          (int index) => Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text('${index + addedvalue}'),),
        ),
      ),
    );
  }
}
