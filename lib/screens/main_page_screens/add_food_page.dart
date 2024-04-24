import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:provider/provider.dart';

import '../../widgets/main_page/homepage_widgets/add_food/search_food/search_widget.dart';
import '../../widgets/main_page/homepage_widgets/add_food/search_food/searched_food_widget.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({
    super.key,
    required this.lunchType,
  });
  final LunchType lunchType;
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
        backgroundColor: const Color.fromARGB(250, 250, 250, 250),
        elevation: 0,
        actions: [
          CupertinoButton(
            child: const Text('Done'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.red, width: 0.5),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Add Food',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: SearchWidget(),
          ),
          if (state.searchedFood.isEmpty)
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SvgPicture.asset(Assets.icons.arrow),
                ),
                const Text(
                  'Click on plus to add your food and set calories',
                  style: TextStyle(
                    color:AppColors.greyColor,
                  ),
                )
              ],
            )
          else
            Expanded(
              child: SearchedFoodsWidget(
                state: state,
                lunchType: lunchType,
              ),
            ),
        ],
      ),
    );
  }
}
