import 'package:flutter/material.dart';

import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/date_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/gender_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/name_input.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const routeName = '/OnboardingScreen';
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                "Answer a few questions for the application to work correctly",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            NameInput(),
            DateInput(),
            GenderInput(),
          ],
        ),
      ),
    );
  }
}
