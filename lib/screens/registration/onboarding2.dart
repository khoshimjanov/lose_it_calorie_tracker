import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/custom_onboarding_sliding_segmented_control.dart';

import '../../widgets/onboarding2_widgets/height_picker_widget.dart';

class OnboardingScreen2 extends StatefulWidget {
  static const routeName = '/OnboardingScreen2';
 const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  bool isCentimentre = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Text(
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              "Indicate your height and weight in order to watch the changes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text('Choose a unit of measure for height'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: CustomOnboardingSlidingSegmentedControl(
                      children: [
                        HeightType.feet.message,
                        HeightType.cm.message,
                      ],
                      onValueChanged: (int value) {
                        isCentimentre = !isCentimentre;
                        setState(() {});
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('How tall are you?'),
                  ),
                  HeightPickerWidget(isCentimentre: isCentimentre),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
