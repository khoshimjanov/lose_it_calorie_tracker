import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/height.dart';
import 'package:lose_it_calory_tracker/provider/person.dart';
import 'package:lose_it_calory_tracker/provider/weight.dart';

import '../widgets/onboarding1_widgets/gender_input.dart';

class RegisterForm with ChangeNotifier {
  Person person = Person(
      name: null,
      id: '1',
      birthdate: null,
      gender: Gender.male,
      height: null,
      weight: null,
      aimweight: null,);
  void addPersonName(String name) {
    person.name = name;
    notifyListeners();
    print('name: ${person.name}');
  }

  void logOut() {
    person = Person(
        name: null,
        id: '1',
        birthdate: null,
        gender: Gender.male,
        height: null,
        weight: null,
        aimweight: null);
  }

  Future<void> addPerson(Person newperson) async {
    person = Person(
        name: person.name,
        id: '1',
        birthdate: newperson.birthdate,
        gender: newperson.gender,
        height: newperson.height,
        weight: newperson.weight,
        aimweight: newperson.aimweight);
  }

  void addPersonBirthday(DateTime birthdate) {
    person.birthdate = birthdate;

    notifyListeners();
    print('birthdate: ${person.birthdate}');
  }

  void addPersonGender(Gender gender) {
    person.gender = gender;

    notifyListeners();
    print('birthdate: ${person.gender}');
  }

  void addPersonHeight(Height height) {
    person.height = height;

    notifyListeners();
    print('height: ${person.height?.feetHeight} ${person.height?.cmHeight}');
  }

  void addPersonWeight(Weight weight) {
    person.weight = weight;

    notifyListeners();
    print(
        'weight: l${person.weight?.lbWeight} s${person.weight?.stLbWeight.stone}.${person.weight?.stLbWeight.lb} k${person.weight?.kgWeight}');
  }

  void addPersonaimWeight(Weight weight) {
    person.aimweight = weight;

    notifyListeners();
    print(
        'aimweight: l${person.aimweight?.lbWeight} s${person.aimweight?.stLbWeight.stone}.${person.aimweight?.stLbWeight.lb} k${person.aimweight?.kgWeight}');
  }
}
