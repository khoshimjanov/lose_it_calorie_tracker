import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';

class BottomBarWidget extends StatelessWidget {
  final int selectedIndex;
  final PageController pageController;
  final Function(int value) action;
  const BottomBarWidget({
    super.key,
    required this.selectedIndex,
    required this.pageController,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      onTap: action,
      // activeColor: Colors.red,
      // backgroundColor: Colors.white,
      currentIndex: selectedIndex,
      border: const Border(top: BorderSide(color: Colors.red, width: 0.4)),

      items: [
        BottomNavigationBarItem(
          icon: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SvgPicture.asset(
              Assets.icons.chosenHome,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0
                    ? Colors.red
                    : const Color.fromARGB(255, 253, 135, 135),
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Home',
          tooltip: 'Back to home',
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                selectedIndex == 1
                    ? Colors.red
                    : const Color.fromARGB(255, 253, 135, 135),
                BlendMode.srcIn,
              ),
              Assets.icons.chart,
            ),
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          label: 'Weight Tracker',
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SvgPicture.asset(
              Assets.icons.macronutrients,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2
                    ? Colors.red
                    : const Color.fromARGB(255, 253, 135, 135),
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Macronutrients',
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
              pageController.animateToPage(
                3,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SvgPicture.asset(
              Assets.icons.settings,
              colorFilter: ColorFilter.mode(
                selectedIndex == 3
                    ? Colors.red
                    : const Color.fromARGB(255, 253, 135, 135),
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
