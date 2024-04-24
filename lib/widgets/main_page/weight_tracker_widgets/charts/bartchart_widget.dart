import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatelessWidget {
  final List<double> data;

  const BarChartWidget({required this.data});
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(color: Colors.white),
          majorGridLines: const MajorGridLines(
            width: 1,
            dashArray: [5, 5],
            color:AppColors.greyColor,
          ),
          majorTickLines: const MajorTickLines(width: 0),
        ),
        plotAreaBorderWidth: 0,
        series: <ChartSeries>[
          ColumnSeries<double, String>(
            color: Colors.red,
            width: 0.5,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            dataSource: data.map((value) => value).toList(),
            xValueMapper: (_, index) => '${days[index]}',
            yValueMapper: (value, _) => value,
          ),
        ],
      ),
    );
  }
}
