import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/food.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';
import 'package:provider/provider.dart';

class AddFoodWidget extends StatelessWidget {
  static const routeName = '/AddFoodWidget';
  const AddFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
        backgroundColor: const Color.fromARGB(250, 250, 250, 250),
        elevation: 0,
        actions: [
          CupertinoButton(child: const Text('Done'), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const MainPageSafeArea(
            text: 'Add Food',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(230, 230, 230, 1),
                  ),

                  width: MediaQuery.of(context).size.width * 0.7,
                  // padding:c EdgeInsets.symmetric(
                  //   horizontal: 20,
                  // ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                    onChanged: (value) =>
                        Provider.of<Foods>(context, listen: false)
                            .searchFood(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(230, 230, 230, 1),
                      ),
                      child: SvgPicture.asset(Assets.icons.plus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SearchedFoodsWidget(state: state),
          ),
        ],
      ),
    );
  }
}



class SearchedFoodsWidget extends StatelessWidget {
  const SearchedFoodsWidget({
    super.key,
    required this.state,
  });

  final Foods state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: state.searchedFood
            .map(
              (
                food,
              ) =>
                  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        // contentPadding: const EdgeInsets.symmetric(
                        //   horizontal: 30,
                        //   vertical: 5,
                        // ),
                        Expanded(
                          child: SvgPicture.asset(food.imageUrl),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            // mainAxisAlignment:
                            // MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  food.name,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  "${food.totalCalorie()} kcal",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(
                                      125,
                                      125,
                                      125,
                                      1,
                                    ),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<Foods>(
                                    context,
                                    listen: false,
                                  ).removeCalorie(food.id);
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Ink(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5),
                                    color: Color.fromRGBO(
                                        230, 230, 230, 1),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.icons.remove,
                                  ),
                                ),
                              ),
                              Text('${food.weight} g'),
                              InkWell(
                                onTap: () {
                                  Provider.of<Foods>(
                                    context,
                                    listen: false,
                                  ).addCalorie(food.id);
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Ink(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5),
                                    color: Color.fromRGBO(
                                        230, 230, 230, 1),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.icons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Provider.of<Foods>(
                                  context,
                                  listen: false,
                                ).addBreakFastFood(food);
                              },
                              child: Ink(
                                // color: Color.fromRGBO(),
                                child: SvgPicture.asset(
                                  state.brakfastFoods.contains(food)
                                      ? Assets.icons.tickedContainer
                                      : Assets.icons.container,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 30,
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
