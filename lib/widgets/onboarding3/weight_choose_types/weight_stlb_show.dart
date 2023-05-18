import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/st_lb.dart';
import 'package:provider/provider.dart';

import '../../../provider/register_form.dart';
import '../../../provider/weight.dart';
import '../weight_input_widget.dart';
import '../weight_type_widgets.dart/weight_picker_classes.dart';

class WeightStLbWidget extends StatefulWidget {
  final bool isSettings;
  const WeightStLbWidget({super.key, this.isSettings = false});

  @override
  State<WeightStLbWidget> createState() => _WeightStLbWidgetState();
}

class _WeightStLbWidgetState extends State<WeightStLbWidget> {
  int _st = 0;
  int _stLb = 0;
  int _stLbDouble = 0;

  double convertStonePoundsToLb(int stones, double pounds) {
    final double lb = double.parse(((stones * 14) + pounds).toStringAsFixed(1));
    return lb;
  }

  double convertStonePoundsToKg(int stones, double pounds) {
    final double lb = (stones * 14) + pounds;
    final double kg = double.parse((lb * 0.45359237).toStringAsFixed(1));
    return kg;
  }

  void _showStLbWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowStLbWeightPicker(
          action1: (value) {
            setState(() {
              _st = value + 1;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _st,
                    lb: double.parse('$_stLb.$_stLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                ),
              );
            });
          },
          action2: (value) {
            setState(() {
              _stLb = value;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _st,
                    lb: double.parse('$_stLb.$_stLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                ),
              );
            });
          },
          action3: (value) {
            setState(() {
              _stLbDouble = value;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _st,
                    lb: double.parse('$_stLb.$_stLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _st,
                    double.parse('$_stLb.$_stLbDouble'),
                  ),
                ),
              );
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
      weightValueChanged: _showStLbWeightPicker,
      weightText: person.weight?.stLbWeight == null
          ? "$_st st $_stLb.$_stLbDouble:"
          : "${person.weight?.stLbWeight.stone} st ${person.weight?.stLbWeight.lb}",
      heightType: 'st/lb',
            isSettings: widget.isSettings,

    );
  }
}

class AimWeightStLbWidget extends StatefulWidget {
  final bool isSettings;
  const AimWeightStLbWidget({super.key, this.isSettings = false});

  @override
  State<AimWeightStLbWidget> createState() => _AimWeightStLbWidgetState();
}

class _AimWeightStLbWidgetState extends State<AimWeightStLbWidget> {
  int _aimst = 0;
  int _aimstLb = 0;
  int _aimstLbDouble = 0;
  double convertStonePoundsToLb(int stones, double pounds) {
    final double lb = double.parse(((stones * 14) + pounds).toStringAsFixed(1));
    return lb;
  }

  double convertStonePoundsToKg(int stones, double pounds) {
    final double lb = (stones * 14) + pounds;
    final double kg = double.parse((lb * 0.45359237).toStringAsFixed(1));
    return kg;
  }

  void _showaimStLbWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowStLbWeightPicker(
          action1: (value) {
            setState(() {
              _aimst = value + 1;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _aimst,
                    lb: double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                ),
              );
            });
          },
          action2: (value) {
            setState(() {
              _aimstLb = value;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _aimst,
                    lb: double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                ),
              );
            });
          },
          action3: (value) {
            setState(() {
              _aimstLbDouble = value;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(
                Weight(
                  lbWeight: convertStonePoundsToLb(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  stLbWeight: StLb(
                    stone: _aimst,
                    lb: double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                  kgWeight: convertStonePoundsToKg(
                    _aimst,
                    double.parse('$_aimstLb.$_aimstLbDouble'),
                  ),
                ),
              );
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
      weightValueChanged: _showaimStLbWeightPicker,
      weightText:person.aimweight?.stLbWeight == null
          ?  "$_aimst st $_aimstLb.$_aimstLbDouble:"
          : "${person.aimweight?.stLbWeight.stone} st ${person.aimweight?.stLbWeight.lb}",
      heightType: 'st/lb',
            isSettings: widget.isSettings,

    );
  }
}
