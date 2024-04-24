import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/macronutients_widgets/diagram_widget.dart';

class MacronutrientsPage extends StatelessWidget {
  static const routeName = '/MacronutrientsPage';

  const MacronutrientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleDiagram();
  }
}
