import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/day_weight_info/day_weight_info.dart';
import 'package:provider/provider.dart';
import '../../../../provider/auth.dart';
import '../charts/bartchart_widget.dart';
import '../date_display.dart';

class DayWidget extends StatelessWidget {
  DayWidget({super.key});
  final weekdayName = DateFormat.EEEE().format(DateTime.now());
  final monthName = DateFormat.MMMM().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateDisplay(
          text: '${DateTime.now().day} $monthName, $weekdayName',
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: DayWeightInfo(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('kg', style: TextStyle(fontSize: 15)),
        ),
        BarChartWidget(
          data: [
            65,
            67,
            69,
            70,
            71,
            72,
            Provider.of<Auth>(context).person!.weight!.kgWeight
          ],
        )
      ],
    );
  }
}
