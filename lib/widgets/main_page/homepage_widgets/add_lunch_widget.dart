import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/bottom_bar_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';

class AddLunch extends StatelessWidget {
  static const routeName = '/addLunch';
  const AddLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: 0,
        pageController: PageController(),
        action: (value) {},
      ),
      appBar: CupertinoNavigationBar(
        border: Border.lerp(null, null, 0),
        trailing: TextButton(
          child: const Text(
            'Done',
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          const MainPageSafeArea(text: 'Breakfast'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.images.breakfastimage),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Add the food you have eaten'),
                )
              ],
            ),
          ),
          // AddFoodButton(
            // action: () {},
          // )
        ],
      ),
    );
  }
}
