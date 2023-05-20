import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/provider/register_form.dart';
import 'package:lose_it_calory_tracker/screens/check_screen.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/home_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/macronutrients_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/main_screen.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/support_widget.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/weight_tracker_page.dart';
import 'package:lose_it_calory_tracker/screens/registration/main_onboarding.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding2.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding1.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding3.dart';
import 'package:lose_it_calory_tracker/screens/subscription_screen.dart';
import 'package:lose_it_calory_tracker/screens/splash_screen.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_breakfast_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_dinner_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_lunch_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_snacks_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => RegisterForm()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(),
            primaryColor: Colors.red,
            buttonTheme: const ButtonThemeData(),
            textTheme: const TextTheme(
              bodySmall: TextStyle(color: Colors.white, fontSize: 15),
              titleSmall: TextStyle(color: Color.fromRGBO(86, 86, 86, 1)),
              titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),),
        home: const CheckScreen(),
        routes: {
          SubscriptionScreen.routeName: (context) => const SubscriptionScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          MainOnboarding.routeName: (context) => const MainOnboarding(),
          OnboardingScreen1.routeName: (context) => const OnboardingScreen1(),
          OnboardingScreen2.routeName: (context) => const OnboardingScreen2(),
          OnboardingScreen3.routeName: (context) => const OnboardingScreen3(),
          MainScreen.routeName: (context) => const MainScreen(),
          HomePage.routeName: (context) => const HomePage(),
          WeightTrackerPage.routeName: (context) => const WeightTrackerPage(),
          MacronutrientsPage.routeName: (context) => const MacronutrientsPage(),
          Settings.routeName: (context) => const Settings(),
          AddBreakFast.routeName: (context) => const AddBreakFast(),
          AddDinner.routeName: (context) => const AddDinner(),
          AddLunch.routeName: (context) => const AddLunch(),
          AddSnacks.routeName: (context) => const AddSnacks(),
          SupporPage.routeName: (context) => const SupporPage()
        },
      ),
    );
  }
}
