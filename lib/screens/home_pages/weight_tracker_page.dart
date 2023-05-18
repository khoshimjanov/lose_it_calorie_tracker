import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';
import 'package:provider/provider.dart';

import '../../provider/register_form.dart';

class WeightTrackerPage extends StatelessWidget {
  static const routeName = '/WeightTrackerPage';
  const WeightTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<RegisterForm>(context).person;

    return Column(
      children: [MainPageSafeArea(text: 'Weight Tracker')],
    );
  }
}
