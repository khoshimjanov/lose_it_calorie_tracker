// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_classes_with_only_static_members

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../provider/person.dart';

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
    try{
    final db = await DBHelper.database();
    final data = await db.query('client');
    if(data.isEmpty){
      return null;
    }
    
    print(" data:$data");
    final sentData = data[0];
    return sentData;
    }catch(e){
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
