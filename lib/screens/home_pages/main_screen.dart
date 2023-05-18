import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/home_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/macronutrients_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/weight_tracker_page.dart';
import 'package:lose_it_calory_tracker/screens/subscription_screen.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/bottom_bar_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/homeScreeb';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // final person = Provider.of<RegisterForm>(context).person;
    return Scaffold(
        bottomNavigationBar: BottomBarWidget(
            selectedIndex: _selectedIndex,
            pageController: pageController,
            action: (value) {
              setState(() {
                _selectedIndex = value;
                pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              });
            }),
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            _selectedIndex = value;

            setState(() {});
          },
          children: [
            HomePage(),
            WeightTrackerPage(),
            MacronutrientsPage(),
            Settings()
          ],
        ));
  }
}
