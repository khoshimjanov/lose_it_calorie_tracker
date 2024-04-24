import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';

class LineGraphWidget extends StatelessWidget {
  final List<double> data;
  final List<int> days;

  const LineGraphWidget({required this.data, required this.days});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0, dashArray: [5, 5]),
          majorTickLines: const MajorTickLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(color: Colors.white),
          majorGridLines: const MajorGridLines(
            width: 1,
            dashArray: [4, 4],
            color: AppColors.greyColor,
          ),
          majorTickLines: const MajorTickLines(
            width: 0,
          ),
        ),
        plotAreaBorderWidth: 0,
        series: <ChartSeries>[
          LineSeries<double, String>(
            pointColorMapper: (datum, index) =>
                data[index] == 0 ? Colors.transparent : Colors.red,
            width: 6,
            dataSource: data.map((value) => value).toList(),
            xValueMapper: (_, index) => '${days[index]}',
            yValueMapper: (value, _) => value,
          ),
        ],
      ),
    );
  }
}
