import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/custom_onboarding_sliding_segmented_control.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_kg_show.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_lb_show.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_stlb_show.dart';

import '../../screens/main_page_screens/settings_page/settings_page.dart';

class WeightPickerWidget extends StatefulWidget {
  const WeightPickerWidget({super.key});

  @override
  _WeightPickerWidgetState createState() => _WeightPickerWidgetState();
}

class _WeightPickerWidgetState extends State<WeightPickerWidget> {
  int _selectedIndex = 0;

  void _onSegmentTapped(int? index) {
    setState(() {
      _selectedIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose a unit of measure for height'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomOnboardingSlidingSegmentedControl(
                children: [
                  WeightType.lb.message,
                  WeightType.stLb.message,
                  WeightType.kg.message
                ],
                onValueChanged: _onSegmentTapped,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('What is your current weight?'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: _selectedIndex == 0
                  ? const WeightLbWidget()
                  : _selectedIndex == 1
                      ? const WeightStLbWidget()
                      : const WeightKgWidget(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('How much weight do you want to be?'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: _selectedIndex == 0
                  ? const AimWeightLbWidget()
                  : _selectedIndex == 1
                      ? const AimWeightStLbWidget()
                      : const AimWeightKgWidget(),
            )
          ],
        ),
      ),
    );
  }
}
