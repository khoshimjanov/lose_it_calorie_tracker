import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/home_page.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/macronutrients_page.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/screens/main_page_screens/weight_tracker_page.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/bottom_bar_widget.dart';


class MainScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final pageController = PageController();
  List<String> titles(String name) {
    return ['Hello,$name!', 'Weight Tracker', 'Macronutrients', 'Settings'];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    
        Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titles(
              Provider.of<Auth>(context).person!.name!,
            )[_selectedIndex],
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        border: const Border(
          bottom: BorderSide(color: Colors.red),
        ),
      ),
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: _selectedIndex,
        pageController: pageController,
        action: (value) {
            _selectedIndex = value;
            pageController.animateToPage(value,duration: const Duration(milliseconds: 300),curve: Curves.easeIn,);
                   setState(() {});
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        children: const [
          HomePage(),
          WeightTrackerPage(),
          MacronutrientsPage(),
          Settings()
        ],
      ),
    );
  
  }
}
