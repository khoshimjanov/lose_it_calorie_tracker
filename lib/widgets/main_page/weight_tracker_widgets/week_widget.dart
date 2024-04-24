import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/date_display.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/weight_info.dart';
import 'package:provider/provider.dart';

import 'charts/linegraph_widget.dart';

class WeekWidget extends StatelessWidget {
  WeekWidget({super.key});

  final weekdayName = DateFormat.EEEE().format(DateTime.now());
  final monthName = DateFormat.MMMM().format(DateTime.now());
  int dayNumber(int index) {
    final day = DateTime.now().subtract(Duration(days: index)).day;
    return day;
  }

  List<int> get days {
    return [
      dayNumber(6),
      dayNumber(5),
      dayNumber(4),
      dayNumber(3),
      dayNumber(2),
      dayNumber(1),
      dayNumber(0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateDisplay(
          text:
              '${DateTime.now().subtract(const Duration(days: 7)).day}-${DateTime.now().day} $monthName',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: WeightInfo(
            gradientColors: AppColors.weekWeightGradient,
            date: '',
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('kg', style: TextStyle(fontSize: 15)),
        ),
        LineGraphWidget(
          data: [
            65,
            67,
            69,
            70,
            71,
            Provider.of<Auth>(context).person!.weight!.kgWeight,
            80,
          ],
          days: days,
        )
      ],
    );
  }
}
