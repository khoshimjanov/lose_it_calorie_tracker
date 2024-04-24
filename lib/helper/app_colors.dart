import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';

class AppColors {
  const AppColors();
  static const Color primaryColor = Colors.red;
  static const Color greyColor = Color.fromRGBO(125, 125, 125, 1);
  static const Color inputWidgetColor = Color.fromRGBO(240, 240, 240, 1);
  static const Color registerInputColor = Color.fromRGBO(220, 220, 220, 1);

  static const List<Color> breakfastGradient = [
    Color.fromRGBO(241, 127, 161, 1),
    Color.fromRGBO(218, 176, 126, 1)
  ];
  static const List<Color> lunchGradient = [
    Color.fromRGBO(68, 153, 99, 1),
    Color.fromRGBO(121, 199, 183, 1)
  ];
  static const List<Color> dinnerGradient = [
    Color.fromRGBO(110, 154, 214, 1),
    Color.fromRGBO(156, 176, 214, 1)
  ];
  static const List<Color> snacksGradient = [
    Color.fromRGBO(140, 123, 178, 1),
    Color.fromRGBO(225, 160, 169, 1)
  ];
  static const List<Color> dayWeightGradient = [
    Color.fromRGBO(241, 127, 161, 1),
    Color.fromRGBO(218, 176, 126, 1)
  ];
  static const List<Color> weekWeightGradient = [
    Color.fromRGBO(68, 153, 99, 1),
    Color.fromRGBO(121, 199, 183, 1),
  ];
  static const List<Color> monthWeightGradient = [
    Color.fromRGBO(110, 154, 214, 1),
    Color.fromRGBO(156, 176, 214, 1)
  ];
  static const List<Color> buttonGradient = [
    Color.fromRGBO(252, 90, 68, 1),
    Color.fromRGBO(196, 20, 50, 1)
  ];

  static List<Color> mealsGradients(LunchType lunchType) {
    switch (lunchType) {
      case LunchType.breakfast:
        return breakfastGradient;
      case LunchType.lunch:
        return lunchGradient;

      case LunchType.dinner:
        return dinnerGradient;
      case LunchType.snacks:
        return snacksGradient;
    }
  }
}
