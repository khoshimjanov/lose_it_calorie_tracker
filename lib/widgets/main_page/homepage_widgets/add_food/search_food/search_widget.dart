import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage_widgets/add_food/new_food/add_new_food.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../provider/foods.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.inputWidgetColor,
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Search',
              ),
              onChanged: (value) =>
                  Provider.of<Foods>(context, listen: false).searchFood(value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding: const EdgeInsets.all(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    content: const AddNewFood(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Ink(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.inputWidgetColor,
                ),
                child: SvgPicture.asset(Assets.icons.plus),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
