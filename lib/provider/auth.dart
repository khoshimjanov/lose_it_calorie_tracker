import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/db_helper/db_helper.dart';
import 'package:lose_it_calory_tracker/model/person.dart';
import 'package:lose_it_calory_tracker/model/st_lb.dart';
import 'package:lose_it_calory_tracker/model/weight.dart';
import 'package:lose_it_calory_tracker/widgets/gender_input.dart';

import '../model/height.dart';

class Auth with ChangeNotifier {
  Person? _person;

  bool get isSignedIn => _person != null;

  Person? get person => _person;

  // ignore: use_setters_to_change_properties
  void addPerson(Person newperson) {
    _person = newperson;
  }

  void logOut() {
    try {
      DBHelper.logOut();
      _person = null;
      notifyListeners();
    } catch (e) {
      print('error in logout:$e');
    }
  }

  void logIn() {
    try {
      DBHelper.logIn(_person!);
    } catch (e) {
      print('error in entering is:$e');
    }
  }

  Future<void> getData() async {
    try {
      final db = await DBHelper.getData();

      if (db == null) {
        _person = null;
        notifyListeners();
        return;
      }
      final i = db;
      final newperson = Person(
        id: i['id'].toString(),
        name: i['name'].toString(),
        birthdate: DateTime.fromMicrosecondsSinceEpoch(
          int.parse(i['datetime'].toString()),
        ),
        gender: i['gender'] == 'Gender.male' ? Gender.male : Gender.female,
        height: Height(
          feetHeight: double.parse(i['heightInFeet'].toString()),
          cmHeight: int.parse(i['heightInCm'].toString()),
        ),
        weight: Weight(
          lbWeight: double.parse(i['weightInLb'].toString()),
          stLbWeight: StLb(
            stone: int.parse(i['weightInSt'].toString()),
            lb: double.parse(i['weightInStLb'].toString()),
          ),
          kgWeight: double.parse(i['weightInKg'].toString()),
        ),
        aimweight: Weight(
          lbWeight: double.parse(i['aimweightInLb'].toString()),
          stLbWeight: StLb(
            stone: int.parse(i['aimweightInSt'].toString()),
            lb: double.parse(i['aimweightInStLb'].toString()),
          ),
          kgWeight: double.parse(i['aimweightInKg'].toString()),
        ),
      );
      _person = newperson;
      notifyListeners();
    } catch (e) {
      print('error in fetching data:$e');
    }
  }

  Future<void> update(Person newperson) async {
    DBHelper.update(newperson);
    _person = newperson;
    notifyListeners();
  }
}
