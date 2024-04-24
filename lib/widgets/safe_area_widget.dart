import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/model/height.dart';
import 'package:lose_it_calory_tracker/model/person.dart';
import 'package:lose_it_calory_tracker/model/st_lb.dart';
import 'package:lose_it_calory_tracker/model/weight.dart';
import 'package:lose_it_calory_tracker/widgets/gender_input.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import '../screens/main_page_screens/main_screen.dart';

class SafeAreaWidget extends StatelessWidget {
  final VoidCallback action;
  const SafeAreaWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: action,
              icon: const Icon(Icons.arrow_back),
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(86, 86, 86, 1),
                ),
              ),
              onPressed: () {
                Provider.of<Auth>(context, listen: false).addPerson(Person(
                    name: 'Dovudhon',
                    id: '1',
                    birthdate: DateTime(2006, 1, 7),
                    gender: Gender.male,
                    height: Height(feetHeight: 5.6, cmHeight: 179),
                    weight: Weight(
                        lbWeight: 189,
                        stLbWeight: StLb(stone: 8, lb: 8),
                        kgWeight: 98,),
                    aimweight: Weight(
                        lbWeight: 189,
                        stLbWeight: StLb(stone: 8, lb: 8),
                        kgWeight: 98,),),);
                Provider.of<Auth>(context, listen: false).logIn();
                Navigator.of(context).pushNamed(MainScreen.routeName);
              },
              child: const Text(
                "SKIP",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
