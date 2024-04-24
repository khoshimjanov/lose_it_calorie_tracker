import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../provider/register_form.dart';

enum Gender {
  male('Male'),
  female('Female');

  const Gender(this.message);
  final String message;

}

class GenderInput extends StatelessWidget {
  const GenderInput({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterForm>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Gender'),
          ),
          Row(
            children: Gender.values
                .map(
                  (gender) => Expanded(
                    child: GenderModelWidget(
                      onChange: () =>
                          Provider.of<RegisterForm>(context, listen: false)
                              .addPersonGender(gender),
                      title: gender.message,
                      isSelected: state.person.gender == gender,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}





class GenderModelWidget extends StatelessWidget {
  final VoidCallback onChange;
  final String title;
  final bool isSelected;

  const GenderModelWidget({
    super.key,
    required this.onChange,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onChange,
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(229, 229, 229, 1)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: SvgPicture.asset(
                  isSelected
                      ? Assets.icons.selectedButton
                      : Assets.icons.unselectedButton,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
