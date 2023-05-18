import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import '../../provider/register_form.dart';

enum Gender {
  male('Male'),
  female('Female');

  const Gender(this.message);
  final String message;
}

class GenderInput extends StatefulWidget {
  const GenderInput({super.key});

  @override
  State<GenderInput> createState() => _GenderInputState();
}

Gender gender = Gender.male;

class _GenderInputState extends State<GenderInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Gender'),
          ),
          Row(children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  gender = Gender.male;
                  setState(() {});
                  Provider.of<RegisterForm>(context, listen: false)
                      .addPersonGender(gender);
                },
                child: Ink(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(gender == Gender.male
                          ? Assets.icons.radioButton2
                          : Assets.icons.radioButton1),
                      const Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  gender = Gender.female;
                  setState(() {});
                  Provider.of<RegisterForm>(context, listen: false)
                      .addPersonGender(gender);
                },
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(gender == Gender.female
                          ? Assets.icons.radioButton2
                          : Assets.icons.radioButton1),
                      const Text(
                        'Female',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
