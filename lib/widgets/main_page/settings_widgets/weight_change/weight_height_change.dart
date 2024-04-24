import 'package:flutter/material.dart';

import '../../../../screens/main_page_screens/settings_page/settings_page.dart';
import '../../../onboarding2_widgets/height_picker_widget.dart';
import '../../../onboarding3/weight_choose_types/weight_kg_show.dart';
import '../../../onboarding3/weight_choose_types/weight_lb_show.dart';
import '../../../onboarding3/weight_choose_types/weight_stlb_show.dart';

class WeightHeightChange extends StatelessWidget {
  const WeightHeightChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Your height, ${heightType == HeightType.feet ? HeightType.feet.message : HeightType.cm.message}',
                      ),
                    ),
                    HeightPickerWidget(
                      isCentimentre: heightType == HeightType.cm,
                      isSettings: true,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Your weight, ${weightType == WeightType.lb ? WeightType.lb.message : (weightType == WeightType.stLb ? WeightType.stLb.message : WeightType.kg.message)}',
                      ),
                    ),
                    if (weightType == WeightType.lb)
                      const WeightLbWidget(isSettings: true)
                    else
                      weightType == WeightType.stLb
                          ? const WeightStLbWidget(isSettings: true)
                          : const WeightKgWidget(isSettings: true),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 15),
                      child: Text(
                        'Goal weight, ${weightType == WeightType.lb ? WeightType.lb.message : (weightType == WeightType.stLb ? WeightType.stLb.message : WeightType.kg.message)}',
                      ),
                    ),
                    if (weightType == WeightType.lb)
                      const AimWeightLbWidget(
                        isSettings: true,
                      )
                    else
                      weightType == WeightType.stLb
                          ? const AimWeightStLbWidget(isSettings: true)
                          : const AimWeightKgWidget(isSettings: true),
                  ],
                ),
              ),
              const Expanded(child: Text(''))
            ],
          )
        ],
      ),
    );
  }
}
