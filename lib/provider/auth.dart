import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/db_helper/db_helper.dart';
import 'package:lose_it_calory_tracker/provider/person.dart';
import 'package:lose_it_calory_tracker/provider/st_lb.dart';
import 'package:lose_it_calory_tracker/provider/weight.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/gender_input.dart';

import 'height.dart';

// Sihn

class Auth with ChangeNotifier {
  Person? _person;

  bool get isSignedIn => _person != null;

  Person? get person => _person;

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
      DBHelper.logIn({
        'id': _person!.id,
        'name': _person!.name!,
        'datetime': _person!.birthdate!.microsecondsSinceEpoch,
        'gender': _person!.gender!.toString(),
        'heightInCm': _person!.height!.cmHeight,
        'heightInFeet': _person!.height!.feetHeight.toString(),
        'weightInLb': _person!.weight!.lbWeight.toString(),
        'weightInSt': _person!.weight!.stLbWeight.stone,
        'weightInStLb': _person!.weight!.stLbWeight.lb.toString(),
        'weightInKg': _person!.weight!.kgWeight.toString(),
        'aimweightInLb': _person!.aimweight!.lbWeight.toString(),
        'aimweightInSt': _person!.aimweight!.stLbWeight.stone,
        'aimweightInStLb': _person!.aimweight!.stLbWeight.lb.toString(),
        'aimweightInKg': _person!.aimweight!.kgWeight.toString(),
      });
    } catch (e) {
      print('error in entering is:$e');
    }
  }

  Future<void> getData() async {
    try {
      final db = await DBHelper.getData();

      final i = db!;
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
      // Provider.of<RegisterForm>(listen: false);
      notifyListeners();
    } catch (e) {
      print('error in fetchin data:$e');
    }
  }

  Future<void> update() async {}
}
