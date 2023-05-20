import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';

class WeightTrackerPage extends StatelessWidget {
  static const routeName = '/WeightTrackerPage';
  const WeightTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: MainPageSafeArea(text: 'Weight Tracker'),
      ),
      body: Column(
        
      ),
    );
  }
}
