import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/date_display.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/weight_info.dart';

import 'charts/linegraph_widget.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget({super.key});

  final weekdayName = DateFormat.EEEE().format(DateTime.now());
  final monthName = DateFormat.MMMM()
      .format(DateTime.now().subtract(const Duration(days: 31)));
  final DateTime firstDayOfMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateDisplay(text: ' $monthName'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: WeightInfo(
            gradientColors: AppColors.monthWeightGradient,
            date: "1 $monthName",
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('kg', style: TextStyle(fontSize: 15)),
        ),
        const LineGraphWidget(
          data: [78, 79, 77, 76, 75, 72, 74],
          days: [1, 5, 10, 15, 20, 25, 30],
        )
      ],
    );
  }
}
