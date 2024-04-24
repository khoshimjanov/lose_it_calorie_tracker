import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_styles.dart';

class WeightInput extends StatelessWidget {
  final bool isSettings;
  final VoidCallback weightValueChanged;
  final String weightText;
  final String heightType;
  const WeightInput({
    super.key,
    required this.weightValueChanged,
    required this.weightText,
    required this.heightType,
    this.isSettings = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: weightValueChanged,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: isSettings
            ? Center(
                child: Text(
                  weightText,
                  style:AppStyles.simpleTextStyle ,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weightText,
                    style: AppStyles.simpleTextStyle,
                  ),
                  Text(
                    heightType,
                    style: AppStyles.simpleTextStyle,
                  ),
                ],
              ),
      ),
    );
  }
}
