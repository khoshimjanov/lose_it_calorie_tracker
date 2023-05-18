import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/register_form.dart';
import 'package:provider/provider.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/date_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/gender_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/name_input.dart';


class OnboardingScreen1 extends StatefulWidget {
  static const routeName = '/OnboardingScreen';
  OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  TextEditingController nameController = TextEditingController();

  DateTime? dateController;

  bool isChosing = false;

// String? name;
  @override
  Widget build(BuildContext context) {
final person= Provider.of<RegisterForm>(context).person.birthdate;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const[
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
            DateInput( // birthdate:   person  ,
),
            GenderInput(),
          ],
        ),
      ),
    );
  }
}
