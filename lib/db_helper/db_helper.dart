// ignore_for_file: avoid_classes_with_only_static_members

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import 'package:lose_it_calory_tracker/model/food.dart';
import 'package:lose_it_calory_tracker/provider/foods.dart';

import '../model/person.dart';

class DBHelper {
  static const name = 'db';
  static Future<sql.Database> database() async {
    try { 
      final dbPath = await sql.getDatabasesPath();
      return sql.openDatabase(
        path.join(dbPath, 'calarieTracker.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE client(id TEXT,name TEXT,datetime INTEGER,gender TEXT,heightInCm INTEGER,heightInFeet TEXT,weightInLb TEXT,weightInSt INTEGER,weightInStLb TEXT,weightInKg TEXT,aimweightInLb TEXT,aimweightInSt INTEGER,aimweightInStLb TEXT,aimweightInKg TEXT);',
          );
        },
        version: 1,
      );
    } catch (e) {
      print("error in creating: $e");
      rethrow;
    }
  }

  static Future<sql.Database> fooddatabase() async {
    try {
      final dbPath = await sql.getDatabasesPath();
      return sql.openDatabase(
        path.join(dbPath, 'calarieTrackerFoods.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE foods(id TEXT,name TEXT,kcal INT,protein INT,fat INT,carb INT,imageUrl TEXT);',
          );
        },
        version: 1,
      );
    } catch (e) {
      print("error in creating table for food: $e");
      rethrow;
    }
  }

  static Future<sql.Database> mealsdatabase() async {
    try {
      final dbPath = await sql.getDatabasesPath();
      return sql.openDatabase(
        path.join(dbPath, 'calorieTrackerMeals.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE meals(mealtype Text,id TEXT,name TEXT,kcal INT,protein INT,fat INT,carb INT,imageUrl TEXT,weight INT,datetime INT);',
          );
        },
        version: 1,
      );
    } catch (e) {
      print("error in creating table for food: $e");
      rethrow;
    }
  }

  static Future<void> logIn(Person person) async {
    try {
      final db = await DBHelper.database();
      db.insert('client', {
        'id': person.id,
        'name': person.name,
        'datetime': person.birthdate!.microsecondsSinceEpoch,
        'gender': person.gender!.toString(),
        'heightInCm': person.height!.cmHeight,
        'heightInFeet': person.height!.feetHeight.toString(),
        'weightInLb': person.weight!.lbWeight.toString(),
        'weightInSt': person.weight!.stLbWeight.stone,
        'weightInStLb': person.weight!.stLbWeight.lb.toString(),
        'weightInKg': person.weight!.kgWeight.toString(),
        'aimweightInLb': person.aimweight!.lbWeight.toString(),
        'aimweightInSt': person.aimweight!.stLbWeight.stone,
        'aimweightInStLb': person.aimweight!.stLbWeight.lb.toString(),
        'aimweightInKg': person.aimweight!.kgWeight.toString(),
      });
    } catch (e) {
      print("error in logging in:$e");
    }
  }

  static Future<Map<String, Object?>?> getData() async {
    try {
      final db = await DBHelper.database();
      final data = await db.query('client');
      if (data.isEmpty) {
        return null;
      }

      print(" data:$data");
      final sentData = data[0];
      return sentData;
    } catch (e) {
      print('erron in getdata:$e');
      rethrow;
    }
  }

  static Future<void> update(Person person) async {
    try {
      final db = await DBHelper.database();
      db.rawUpdate("""
   UPDATE client SET 
         name=?,
         datetime= ?,
         gender= ?,
         heightInCm= ?,
         heightInFeet= ?,
         weightInLb= ?,
         weightInSt= ?,
         weightInStLb= ?,
         weightInKg= ?,
         aimweightInLb= ?,
         aimweightInSt= ?,
         aimweightInStLb= ?,
         aimweightInKg= ? WHERE id = '1';
""", [
        person.name,
        person.birthdate!.microsecondsSinceEpoch,
        person.gender!.toString(),
        person.height!.cmHeight,
        person.height!.feetHeight.toString(),
        person.weight!.lbWeight.toString(),
        person.weight!.stLbWeight.stone,
        person.weight!.stLbWeight.lb.toString(),
        person.weight!.kgWeight.toString(),
        person.aimweight!.lbWeight.toString(),
        person.aimweight!.stLbWeight.stone,
        person.aimweight!.stLbWeight.lb.toString(),
        person.aimweight!.kgWeight.toString()
      ]);
    } catch (error) {
      print("error in updating:$error");
      rethrow;
    }
  }

  static Future<void> logOut() async {
    try {
      final db = await DBHelper.database();
      db.delete(
        'client',
      );
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> addNewFood(Food food) async {
    final db = await DBHelper.fooddatabase();
    db.insert('foods', {
      'id': food.id,
      "name": food.name,
      "kcal": food.kcal,
      "protein": food.protein,
      "fat": food.fat,
      "carb": food.carb,
      "imageUrl": food.imageUrl
    });
  }

  static Future<List<Food>> getFoods() async {
    try {
      final db = await DBHelper.fooddatabase();
      final List<Map<String, Object?>> data = await db.query('foods');
      if (data.isEmpty) {
        return [];
      }

      // final sentData = data[0];
      final List<Food> newFoods = [];
      for (final i in data) {
        // if (i['name'].toString() == 'jfhjhjj') {
        //   final db = await DBHelper.fooddatabase();
        //   db.delete(
        //     'foods',
        //     where: 'id=? ',
        //     whereArgs: [i['id'].toString()],
        //   );
        //   continue;
        // }
        newFoods.add(
          Food(
            id: i['id'].toString(),
            name: i["name"].toString(),
            kcal: int.parse(i["kcal"].toString()),
            protein: int.parse(i["protein"].toString()),
            fat: int.parse(i["fat"].toString()),
            carb: int.parse(i["carb"].toString()),
            imageUrl: i["imageUrl"].toString(),
          ),
        );
      }
      print(" data:$data");

      return newFoods;
    } catch (e) {
      print('erron in getting data:$e');
      rethrow;
    }
  }

  static Future<void> addMealFood(LunchType lunchType, Food food) async {
    final db = await DBHelper.mealsdatabase();

    db.insert('meals', {
      'mealtype': lunchType.message,
      'id': food.id,
      "name": food.name,
      "kcal": food.kcal,
      "protein": food.protein,
      "fat": food.fat,
      "carb": food.carb,
      "imageUrl": food.imageUrl,
      "weight": food.weight,
      'datetime': DateTime.now().millisecondsSinceEpoch
    });
  }

  static Future<List<List<Food>>> getMealFoods() async {
    try {
      final db = await DBHelper.mealsdatabase();
      final List<Map<String, Object?>> data = await db.query('meals');
      if (data.isEmpty) {
        return [];
      }

      print(" data:$data");
      // final sentData = data[0];
      final List<Food> breakfastFoods = [];
      final List<Food> lunchFoods = [];
      final List<Food> dinnerFoods = [];
      final List<Food> snackFoods = [];

      for (final i in data) {
        final date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(i['datetime'].toString()),
        );
        final today = DateTime.now();
        final formatter = DateFormat('yyyy-MM-dd');
        final firstDate = formatter.format(date);
        final todayDate = formatter.format(today);
        if (firstDate != todayDate) {
          DBHelper.deleteMeal(i['mealtype'].toString(), i['id'].toString());
          continue;
        }
        if (i['mealtype'] == "breakfast") {
          breakfastFoods.add(
            Food(
              id: i['id'].toString(),
              name: i["name"].toString(),
              kcal: int.parse(i["kcal"].toString()),
              protein: int.parse(i["protein"].toString()),
              fat: int.parse(i["fat"].toString()),
              carb: int.parse(i["carb"].toString()),
              imageUrl: i["imageUrl"].toString(),
              weight: int.parse(i["weight"].toString()),
            ),
          );
        } else if (i['mealtype'] == "lunch") {
          lunchFoods.add(
            Food(
              id: i['id'].toString(),
              name: i["name"].toString(),
              kcal: int.parse(i["kcal"].toString()),
              protein: int.parse(i["protein"].toString()),
              fat: int.parse(i["fat"].toString()),
              carb: int.parse(i["carb"].toString()),
              imageUrl: i["imageUrl"].toString(),
              weight: int.parse(i["weight"].toString()),
            ),
          );
        } else if (i['mealtype'] == "dinner") {
          dinnerFoods.add(
            Food(
              id: i['id'].toString(),
              name: i["name"].toString(),
              kcal: int.parse(i["kcal"].toString()),
              protein: int.parse(i["protein"].toString()),
              fat: int.parse(i["fat"].toString()),
              carb: int.parse(i["carb"].toString()),
              imageUrl: i["imageUrl"].toString(),
              weight: int.parse(i["weight"].toString()),
            ),
          );
        } else {
          snackFoods.add(
            Food(
              id: i['id'].toString(),
              name: i["name"].toString(),
              kcal: int.parse(i["kcal"].toString()),
              protein: int.parse(i["protein"].toString()),
              fat: int.parse(i["fat"].toString()),
              carb: int.parse(i["carb"].toString()),
              imageUrl: i["imageUrl"].toString(),
              weight: int.parse(i["weight"].toString()),
            ),
          );
        }
      }
      return [
        breakfastFoods,
        lunchFoods,
        dinnerFoods,
        snackFoods,
      ];
    } catch (e) {
      print('erron in getting data:$e');
      rethrow;
    }
  }

  static Future<void> mealupdate(Food food) async {
    try {
      final db = await DBHelper.mealsdatabase();
      db.rawUpdate(
        """
   UPDATE meals SET 
      weight =? WHERE id = ${food.id};
""",
        [food.weight],
      );
    } catch (error) {
      print("error in updating:$error");
      rethrow;
    }
  }

  static Future<void> deleteMeal(String lunchType, String id) async {
    try {
      final db = await DBHelper.mealsdatabase();
      db.delete(
        'meals',
        where: 'id=? and mealtype=?',
        whereArgs: [id, lunchType],
      );
    } catch (error) {
      rethrow;
    }
  }
}
