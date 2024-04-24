import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_colors.dart';
import 'package:lose_it_calory_tracker/helper/app_styles.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:provider/provider.dart';

import 'weight_change_dialog.dart';

class DayWeightInfo extends StatelessWidget {
  const DayWeightInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Auth>(context).person;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.dayWeightGradient,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weight Today',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const WeightChangeDialog(),
                      );
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'Record Weight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Weight needs to be lost',
                  style: AppStyles.whiteButtonStyle,
                ),
                Text(
                  '${state!.weight!.kgWeight - state.aimweight!.kgWeight <= 0 ? 0 : state.weight!.kgWeight - state.aimweight!.kgWeight} kg',
                  style: AppStyles.whiteTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
