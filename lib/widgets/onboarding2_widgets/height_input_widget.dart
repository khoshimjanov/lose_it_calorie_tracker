import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_styles.dart';

class HeightInput extends StatelessWidget {
  final VoidCallback action;
  final String text;
  final String heightType;
  final bool isSettings;
  const HeightInput({
    super.key,
    required this.action,
    required this.text,
    required this.heightType,
    this.isSettings = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: isSettings
            ? Center(
                child: Text(
                  text,
                  style: AppStyles.simpleTextStyle,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
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
