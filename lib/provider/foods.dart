import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/food.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/homepage/add_breakfast_widget.dart';

class Foods with ChangeNotifier {
  final List<Food> _foods = [
    Food(
      id: '1',
      name: 'Burger',
      kcal: 300,
      protein: 23,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.burger,
    ),
    Food(
      id: '2',
      name: 'Cake',
      kcal: 30,
      protein: 23,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.cake,
    ),
    Food(
      id: '3',
      name: 'Carrot',
      kcal: 140,
      protein: 23,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.carrot,
    ),
    Food(
      id: '4',
      name: 'Celery',
      kcal: 130,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.celery,
    ),
    Food(
      id: '5',
      name: 'Cheese',
      kcal: 350,
      protein: 90,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.cheese,
    ),
    Food(
      id: '6',
      name: 'Chocolate',
      kcal: 140,
      protein: 24,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.chocolate,
    ),
    Food(
      id: '7',
      name: 'Cookie',
      kcal: 130,
      protein: 45,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.cookie,
    ),
    Food(
      id: '8',
      name: 'Corn',
      kcal: 80,
      protein: 0,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.corn,
    ),
    Food(
      id: '9',
      name: 'Donut',
      kcal: 40,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.donut,
    ),
    Food(
      id: '10',
      name: 'Egg',
      kcal: 230,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.egg,
    ),
    Food(
      id: '11',
      name: 'Fish',
      kcal: 90,
      protein: 24,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.fish,
    ),
    Food(
      id: '12',
      name: 'FrenchFries',
      kcal: 135,
      protein: 23,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.frenchFries,
    ),
    Food(
      id: '13',
      name: 'FriedChicken',
      kcal: 140,
      protein: 24,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.friedChicken,
    ),
    Food(
      id: '14',
      name: 'FriedEgg',
      kcal: 240,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.friedEgg,
    ),
    Food(
      id: '15',
      name: 'Honey',
      kcal: 140,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.honey,
    ),
    Food(
      id: '16',
      name: 'Kiwi',
      kcal: 120,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.kiwi,
    ),
    Food(
      id: '17',
      name: 'Lobster',
      kcal: 160,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.lobster,
    ),
    Food(
      id: '18',
      name: 'Mushroom',
      kcal: 170,
      protein: 53,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.mushroom,
    ),
    Food(
      id: '19',
      name: 'Orange Juice',
      kcal: 190,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.orangeJuice,
    ),
    Food(
      id: '20',
      name: 'Pizza',
      kcal: 160,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.pizza,
    ),
    Food(
      id: '21',
      name: 'Pumpkin',
      kcal: 80,
      protein: 24,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.pumpkin,
    ),
    Food(
      id: '22',
      name: 'Ramen',
      kcal: 90,
      protein: 23,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.ramen,
    ),
    Food(
      id: '23',
      name: 'Salad',
      kcal: 310,
      protein: 21,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.salad,
    ),
    Food(
      id: '24',
      name: 'Salmon',
      kcal: 240,
      protein: 53,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.salmon,
    ),
    Food(
      id: '25',
      name: 'Shrimp',
      kcal: 210,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.shrimp,
    ),
    Food(
      id: '26',
      name: 'Soup',
      kcal: 170,
      protein: 84,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.soup,
    ),
    Food(
      id: '27',
      name: 'Bread',
      kcal: 90,
      protein: 24,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.bread,
    ),
    Food(
      id: '28',
      name: 'Lemon',
      kcal: 190,
      protein: 43,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.lemon,
    ),
    Food(
      id: '29',
      name: 'Acorn',
      kcal: 140,
      protein: 33,
      fat: 2,
      carb: 1,
      imageUrl: Assets.icons.acorn,
    ),
  ];
  List<Food> searchedFood = [];
  List<Food> brakfastFoods = [];
  List<Food> lunchFoods = [];
  List<Food> dinnerFoods = [];
  List<Food> snackFoods = [];
  List<Food> get foods => _foods;
  void addNewFood(Food newfood) {
    _foods.add(newfood);
    notifyListeners();
  }

  void searchFood(String name) {
    searchedFood = _foods
        .where((food) => food.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void addBreakFastFood(Food newfood) {
    if (brakfastFoods.contains(newfood)) {
      brakfastFoods.remove(newfood);
    } else {
      brakfastFoods.add(newfood);
    }
    notifyListeners();
  }

  void removeBreakFastFood(Food newfood) {
    brakfastFoods.remove(newfood);
    notifyListeners();
  }

  void addCalorie(String id) {
    _foods.firstWhere((element) => element.id == id).weight += 100;
    notifyListeners();
  }

  void removeCalorie(String id) {
    if (_foods.firstWhere((element) => element.id == id).weight == 100) {
      return;
    }
    _foods.firstWhere((element) => element.id == id).weight -= 100;
    notifyListeners();
  }
}
