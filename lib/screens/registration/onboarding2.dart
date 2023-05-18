import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding3.dart';
import 'package:lose_it_calory_tracker/widgets/safe_area_widget.dart';

import '../../widgets/elevated_button_widget.dart';
import '../../widgets/onboarding2_widgets/height_picker_widget.dart';

class OnboardingScreen2 extends StatefulWidget {
  static const routeName = '/OnboardingScreen2';
  OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  bool? isCentimentre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              "Indicate your height and weight in order to watch the changes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          
          HeightPickerWidget(),
        ],
      ),
    );
  }
}
