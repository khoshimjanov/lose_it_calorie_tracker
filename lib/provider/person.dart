import 'package:lose_it_calory_tracker/provider/weight.dart';

import '../widgets/onboarding1_widgets/gender_input.dart';
import 'height.dart';

class Person {
  String id;
  String? name;
  DateTime? birthdate;
  Gender? gender;
  Height? height;
  Weight? weight;
  Weight? aimweight;
  Person({
    required this.name,
    required this.id,
    required this.birthdate,
    required this.gender,
    required this.height,
    required this.weight,
    required this.aimweight,
  });

  Person copyWith(String? name, DateTime? birthdate, Gender? gender,
      Height? height, Weight? weight, Weight? aimweight,) {
    return Person(
        id: '',
        name: name ?? this.name,
        birthdate: birthdate ?? this.birthdate,
        gender: gender ?? this.gender,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        aimweight: aimweight ?? this.aimweight);
  }
}
