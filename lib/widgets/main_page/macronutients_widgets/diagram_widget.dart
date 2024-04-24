import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:lose_it_calory_tracker/gen/assets.gen.dart';

import 'diagam_painter.dart';

class CircleDiagram extends StatelessWidget {
  final weekdayName = DateFormat.EEEE().format(DateTime.now());
  final monthName = DateFormat.MMMM().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              '${DateTime.now().day} $monthName, $weekdayName',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: CustomPaint(
              painter: CircleDiagramPainter(
                bluePercentage: 20,
                greenPercentage: 45,
                redPercentage: 35,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.redDot),
                        const Text(" Carb")
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('35% / 0g'),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.greenDot),
                        const Text(" Protein")
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('45% / 0g'),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.blueDot),
                        const Text(" Fat")
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('20% / 0g'),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
