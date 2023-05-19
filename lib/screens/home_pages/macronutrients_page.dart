import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/macronutients/diagram_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';

class MacronutrientsPage extends StatelessWidget {
  static const routeName = '/MacronutrientsPage';

  const MacronutrientsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const MainPageSafeArea(
          text: 'Macronutrients',
        ),
        CircleDiagram(
          radius: 30,
          borderColor: Colors.transparent,
          elements: [
            CircleElement(percentage: 25, color: Colors.red),
            CircleElement(percentage: 50, color: Colors.green),
            CircleElement(percentage: 25, color: Colors.blue),
          ],
        )
      ],
    );
  }
}
