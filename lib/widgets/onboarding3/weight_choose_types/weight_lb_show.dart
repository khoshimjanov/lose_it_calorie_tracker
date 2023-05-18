import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/register_form.dart';
import '../../../provider/st_lb.dart';
import '../../../provider/weight.dart';
import '../weight_input_widget.dart';
import '../weight_type_widgets.dart/weight_picker_classes.dart';

class WeightLbWidget extends StatefulWidget {
  const WeightLbWidget({super.key});

  @override
  State<WeightLbWidget> createState() => _WeightLbWidgetState();
}

class _WeightLbWidgetState extends State<WeightLbWidget> {
  int _lb = 0;
  int _lbDouble = 0;

  double convertLbToKg(double lb) {
   final double kg = double.parse((lb * 0.453592).toStringAsFixed(1));
    return kg;
  }

  StLb convertLbToStoneLb(double lb) {
   final int stone = (lb / 14).floor();
   final double pounds = double.parse((lb % 14).toStringAsFixed(1));
    return StLb(stone: stone, lb: pounds);
  }

  void _showLBWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowLBWeightPicker(
          action1: (value) {
            setState(() {
              _lb = value + 100;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                  Weight(
                      lbWeight: double.parse('$_lb.$_lbDouble'),
                      stLbWeight:
                          convertLbToStoneLb(double.parse('$_lb.$_lbDouble')),
                      kgWeight:
                          convertLbToKg(double.parse('$_lb.$_lbDouble')),),);
            });
          },
          action2: (value) {
            setState(() {
              _lbDouble = value;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                  Weight(
                      lbWeight: double.parse('$_lb.$_lbDouble'),
                      stLbWeight:
                          convertLbToStoneLb(double.parse('$_lb.$_lbDouble')),
                      kgWeight:
                          convertLbToKg(double.parse('$_lb.$_lbDouble')),),);
            });
          },
        );
      },
    );
  }
  int _aimlb = 0;
  int _aimlbDouble = 0;
  void _showAimLBWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowLBWeightPicker(
          action1: (value) {
            setState(() {
              _aimlb = value + 100;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(Weight(
                      lbWeight: double.parse('$_aimlb.$_aimlbDouble'),
                      stLbWeight: convertLbToStoneLb(
                          double.parse('$_aimlb.$_aimlbDouble'),),
                      kgWeight: convertLbToKg(
                          double.parse('$_aimlb.$_aimlbDouble'),),),);
            });
          },
          action2: (value) {
            setState(() {
              _aimlbDouble = value;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(Weight(
                      lbWeight: double.parse('$_aimlb.$_aimlbDouble'),
                      stLbWeight: convertLbToStoneLb(
                          double.parse('$_aimlb.$_aimlbDouble'),),
                      kgWeight: convertLbToKg(
                          double.parse('$_aimlb.$_aimlbDouble'),),),);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<RegisterForm>(context).person;

    return WeightInput(
      weightValueChanged: _showLBWeightPicker,
      aimWeightValueChanged: _showAimLBWeightPicker,
      weightText: '${person.weight?.lbWeight ?? '$_lb.$_lbDouble'}',
      aimWeightText: '${person.aimweight?.lbWeight ?? '$_aimlb.$_aimlbDouble'}',
      heightType: 'lb',
    );
  }
}
