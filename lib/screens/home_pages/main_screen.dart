import 'package:flutter/material.dart';

import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/provider/person.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/home_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/macronutrients_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/weight_tracker_page.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/bottom_bar_widget.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/gender_input.dart';
import 'package:provider/provider.dart';

import '../../provider/register_form.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/homeScreeb';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  Provider.of<RegisterForm>(context, listen: false).addPerson(Provider.of<Auth>(context).person==null? Person(name: null, id: '1', birthdate: null, gender: Gender.male, height: null, weight: null, aimweight: null):Provider.of<Auth>(context).person!) ,
      builder:(context, snapshot) {

        return Scaffold(
            bottomNavigationBar: BottomBarWidget(
                selectedIndex: _selectedIndex,
                pageController: pageController,
                action: (value) {
                  setState(() {
                    _selectedIndex = value;
                    pageController.animateToPage(value,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,);
                  });
                },),
            body: PageView(
              controller: pageController,
              onPageChanged: (value) {
                _selectedIndex = value;

                setState(() {});
              },
              children:const [
                HomePage(),
                WeightTrackerPage(),
                MacronutrientsPage(),
                Settings()
              ],
            ),);
      },
    );
  }
}
