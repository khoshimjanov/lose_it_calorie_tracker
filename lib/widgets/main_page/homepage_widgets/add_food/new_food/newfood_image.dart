import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/model/food.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:provider/provider.dart';

class NewFoodImage extends StatefulWidget {
  const NewFoodImage({
    super.key,
    required this.state,
  });

  final List<Food> state;

  @override
  State<NewFoodImage> createState() => _NewFoodImageState();
}


class _NewFoodImageState extends State<NewFoodImage> {
int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          widget.state.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                _selectedIndex = index;

                Provider.of<Foods>(context, listen: false).newFood.imageUrl =
                    widget.state[index].imageUrl;

                setState(() {});
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      widget.state[index].imageUrl,
                    ),
                  ),
                  if (_selectedIndex == index)
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.icons.tick),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
