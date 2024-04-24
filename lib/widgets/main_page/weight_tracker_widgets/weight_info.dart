import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:provider/provider.dart';

class WeightInfo extends StatelessWidget {
  final String date;
 
  final List<Color> gradientColors;
  const WeightInfo({
    super.key,
    required this.date,
    required this.gradientColors,
  });
  
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Auth>(context).person;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight on $date',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${state!.weight!.kgWeight - state.aimweight!.kgWeight} kg',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight today',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${state.weight!.kgWeight} kg',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight needs to be lost',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${state.weight!.kgWeight - state.aimweight!.kgWeight<=0?0:state.weight!.kgWeight - state.aimweight!.kgWeight} kg',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
