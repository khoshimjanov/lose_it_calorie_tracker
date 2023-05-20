import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/screens/registration/main_onboarding.dart';
import 'package:lose_it_calory_tracker/widgets/elevated_button_widget.dart';
import 'package:lose_it_calory_tracker/widgets/info_icon_widget.dart';

import '../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/spash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            SafeArea(child: Assets.images.weightImage.image()),
            const SizedBox(
              width: 200,
              child: Text(
                'Calorie Tracker',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InfoIconWidget(
                    icon: Assets.icons.avocado,
                    text: 'Track what you eat',
                  ),
                  InfoIconWidget(
                      icon: Assets.icons.pieChart1,
                      text: 'Follow a calorie budget',),
                  InfoIconWidget(
                      icon: Assets.icons.slim1, text: 'Reach your goals',),
                ],
              ),
            ),
            ElevatedButtonWidget(
                text: 'Get Started',
                action: () {
                  Navigator.of(context).pushNamed(MainOnboarding.routeName);
                },),
          ],),
    );
  }
}
