import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/custom_sliding_segmented_control.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_kg_show.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_lb_show.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_choose_types/weight_stlb_show.dart';


import '../../screens/home_pages/settings_page/settings_page.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: CustomSlidingSegmentedControl(
              children: [ WeightType.lb.message,
                    WeightType.stLb.message,
                    WeightType.kg.message], onValueChanged: _onSegmentTapped,),
       
          ),
      if (_selectedIndex == 0)
        const WeightLbWidget()
      else if (_selectedIndex == 1)
        const WeightStLbWidget()
      else
        const WeightKgWidget()
    ],);
  }
}
