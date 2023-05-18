// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../provider/person.dart';

class DBHelper {
  static const name = 'db';
  static Future<sql.Database> database() async {
    try{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'losteItCalorieTracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE client(id TEXT,name TEXT,datetime INTEGER,gender TEXT,heightInCm INTEGER,heightInFeet TEXT,weightInLb TEXT,weightInSt INTEGER,weightInStLb TEXT,weightInKg TEXT,aimweightInLb TEXT,aimweightInSt INTEGER,aimweightInStLb TEXT,aimweightInKg TEXT);',
        );
      },
      version: 1,
    );
    }
    catch(e){
      print("error in creating: $e");
      rethrow;
    }
  }

  static Future<void> logIn(Map<String, Object> data) async {
    try {
      final db = await DBHelper.database();
      db.insert('client', data);
    } catch (e) {
      print("error in logging in:$e");
    }
  }

 static Future<Map<String, Object?>?> getData() async {
   
    final db = await DBHelper.database();
    final data = await db.query('client');
      print(" data:$data");
      final sentData=data[0];
    return sentData;
   
      
   
    
    
  }

  static Future<void> update(Person item) async {
    try {
      final db = await DBHelper.database();
      db.rawUpdate(''
          // 'UPDATE person SET quantity = ${item.quantity + 1} WHERE id = "1"',
          );
    } catch (error) {
      rethrow;
    }
  }

  // static Future<void> decreaseSingleItem(Person person) async {
  //   try {
  //     final db = await DBHelper.database();
  //     db.rawUpdate(
  //       'UPDATE $table SET quantity = ${item.quantity - 1} WHERE id = "${item.id}"',
  //     );
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // static Future<void> removeSingleItem(String table, String id) async {
  //   try {
  //     final db = await DBHelper.database();
  //     db.delete(
  //       table,
  //       where: 'id = "$id"',
  //     );
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

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
}
