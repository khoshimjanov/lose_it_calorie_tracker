import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/main_screen.dart';
import 'package:lose_it_calory_tracker/screens/splash_screen.dart';
import 'package:lose_it_calory_tracker/widgets/info_icon_widget.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';

class SubscriptionScreen extends StatelessWidget {
  static const routeName = '/SubscriptionScreen';
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSignedIn = Provider.of<Auth>(context).isSignedIn;
    return isSignedIn
        ? const MainScreen()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SafeArea(
                    minimum: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              exit(1);
                            },
                            icon: const Icon(Icons.close)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 0.2)),
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  const Color.fromRGBO(250, 250, 250, 0)),
                          child: const Text("Restore Purchases"),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Assets.images.weightImage.image(),
                  const Text(
                    'Calorie Tracker',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoIconWidget(
                            icon: Assets.icons.barGraph1,
                            text: 'All functions of calorie counter'),
                        InfoIconWidget(
                          icon: Assets.icons.weightScale1,
                          text: 'Weight tracker',
                        ),
                        InfoIconWidget(
                          icon: Assets.icons.pieChart1,
                          text: 'Macronutrients tracker',
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SplashScreen.routeName);
                          },
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(252, 90, 68, 1),
                                    Color.fromRGBO(196, 20, 50, 1)
                                  ]),
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              height: 50,
                              width: 300,
                              child: const Text(
                                "\$3.99 per week",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ))),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SplashScreen.routeName);
                          },
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(252, 90, 68, 1),
                                    Color.fromRGBO(196, 20, 50, 1)
                                  ]),
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              height: 50,
                              width: 300,
                              child: const Text(
                                "\$9.99 per three months",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Privacy Policy'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Terms Of Use'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
