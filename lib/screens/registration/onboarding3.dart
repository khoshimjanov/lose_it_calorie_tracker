import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_picker_widget.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const routeName = '/OnboardingScreen3';
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
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
        
          WeightPickerWidget(),
        ],
      ),
    );
  }
}
