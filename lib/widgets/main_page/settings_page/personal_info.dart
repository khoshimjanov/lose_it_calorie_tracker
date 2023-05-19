import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/settings_page/data_settings.dart';
import 'package:provider/provider.dart';

import '../../../screens/home_pages/settings_page/settings_page.dart';
import '../../onboarding1_widgets/gender_input.dart';

class PersonalInfo extends StatelessWidget {
  final HeightType heightType;
  final WeightType weightType;
  const PersonalInfo({
    super.key,
    required this.heightType,
    required this.weightType,
  });

  String subTitle(Gender gender, DateTime birthdate) {
  final  String genderName =
        gender == Gender.male ? Gender.male.message : Gender.female.message;
    final now = DateTime.now();
    int age = now.year - birthdate.year;

    if (now.month < birthdate.month ||
        (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return '$genderName, $age years old';
  }

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Auth>(context).person!;
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),),),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),),
                child: Center(child: SvgPicture.asset(Assets.icons.camera)),
              ),
              title: Text(
                person.name!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                subTitle(
                  person.gender!,
                  person.birthdate!,
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const SingleChildScrollView(child: DataSettings()),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(Assets.icons.moreVert,
                      // ignore: deprecated_member_use
                      color: const Color.fromRGBO(86, 86, 86, 1),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(heightType == HeightType.cm
                            ? '${person.height!.cmHeight} cm'
                            : '${person.height!.feetHeight} ft/in',),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color.fromRGBO(229, 229, 229, 1),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weight',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(weightType == WeightType.kg
                            ? "${person.weight!.kgWeight} kg"
                            : (weightType == WeightType.lb
                                ? "${person.weight!.lbWeight} lb"
                                : "${person.weight!.stLbWeight.stone}st ${person.weight!.stLbWeight.lb}lb"),)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color.fromRGBO(229, 229, 229, 1),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Goal Weight',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(weightType == WeightType.kg
                            ? "${person.aimweight!.kgWeight} kg"
                            : (weightType == WeightType.lb
                                ? "${person.aimweight!.lbWeight} lb"
                                : "${person.aimweight!.stLbWeight.stone}st${person.aimweight!.stLbWeight.lb}lb"),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Free Member',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Ink(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(252, 90, 68, 1),
                            Color.fromRGBO(196, 20, 50, 1)
                          ],),),
                      child: const Center(
                        child: Text(
                          'SWITCH TO PREMIUM',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),);
  }
}
