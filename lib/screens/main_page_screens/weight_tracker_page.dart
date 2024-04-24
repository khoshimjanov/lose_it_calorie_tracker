import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/day_weight_info/day_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/month_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/weight_tracker_widgets/week_widget.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/custom_onboarding_sliding_segmented_control.dart';

class WeightTrackerPage extends StatefulWidget {
  static const routeName = '/WeightTrackerPage';
  const WeightTrackerPage({super.key});

  @override
  State<WeightTrackerPage> createState() => _WeightTrackerPageState();
}

int currentIndex = 0;

class _WeightTrackerPageState extends State<WeightTrackerPage> {
  @override
  void dispose() {
    currentIndex = 0;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: CustomOnboardingSlidingSegmentedControl(
              children: const ['day', 'week', 'month'],
              onValueChanged: (value) {
                currentIndex = value;
                setState(() {});
                print(currentIndex);
              },
            ),
          ),
          if (currentIndex == 0)
            DayWidget()
          else if (currentIndex == 1)
            WeekWidget()
          else
            MonthWidget(),
        ],
      ),
    );
  }
}
