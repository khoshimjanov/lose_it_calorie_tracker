import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/register_form.dart';
import '../../../model/st_lb.dart';
import '../../../model/weight.dart';
import '../weight_input_widget.dart';
import '../weight_type_widgets.dart/weight_picker_classes.dart';

class WeightKgWidget extends StatefulWidget {
  final bool isSettings;
  const WeightKgWidget({super.key, this.isSettings = false});

  @override
  State<WeightKgWidget> createState() => _WeightKgWidgetState();
 static StLb convertKgToStoneLb(double kg) {
    final double totalLb = kg * 2.20462;
    final int stone = (totalLb / 14).floor();
    final double pounds = double.parse((totalLb % 14).toStringAsFixed(1));
    return StLb(stone: stone, lb: pounds);
  }
}

class _WeightKgWidgetState extends State<WeightKgWidget> {
  int _kg = 0;
  int _kgDouble = 0;


 static double convertKgToLb(double kg) {
    final double lb = double.parse((kg * 2.20462).toStringAsFixed(1));

    return lb;
  }

  void _showKgWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowKgWeightPicker(
          onKgChange: (value) {
            setState(() {
              _kg = value + 30;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertKgToLb(double.parse('$_kg.$_kgDouble')),
                  stLbWeight:
                      WeightKgWidget.convertKgToStoneLb(double.parse('$_kg.$_kgDouble')),
                  kgWeight: double.parse('$_kg.$_kgDouble'),
                ),
              );
            });
          },
          onKgDoubleChange: (value) {
            setState(() {
              _kgDouble = value;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertKgToLb(double.parse('$_kg.$_kgDouble')),
                  stLbWeight:
                     WeightKgWidget. convertKgToStoneLb(double.parse('$_kg.$_kgDouble')),
                  kgWeight: double.parse('$_kg.$_kgDouble'),
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
      weightValueChanged: _showKgWeightPicker,
      weightText: "${person.weight?.kgWeight ?? '$_kg.$_kgDouble'}",
      heightType: 'kg',
            isSettings: widget.isSettings,

    );
  }
}

class AimWeightKgWidget extends StatefulWidget {
  final bool isSettings;
  const AimWeightKgWidget({super.key, this.isSettings = false});

  @override
  State<AimWeightKgWidget> createState() => _AimWeightKgWidgetState();
}

class _AimWeightKgWidgetState extends State<AimWeightKgWidget> {
  int _aimkg = 0;
  int _aimkgDouble = 0;
  StLb convertKgToStoneLb(double kg) {
    final double totalLb = kg * 2.20462;
    final int stone = (totalLb / 14).floor();
    final double pounds = double.parse((totalLb % 14).toStringAsFixed(1));
    return StLb(stone: stone, lb: pounds);
  }

  double convertKgToLb(double kg) {
    final double lb = double.parse((kg * 2.20462).toStringAsFixed(1));

    return lb;
  }

  void _showaimKgWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowKgWeightPicker(
          onKgChange: (value) {
            setState(() {
              _aimkg = value + 30;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(
                Weight(
                  lbWeight:
                      convertKgToLb(double.parse('$_aimkg.$_aimkgDouble')),
                  stLbWeight: convertKgToStoneLb(
                    double.parse('$_aimkg.$_aimkgDouble'),
                  ),
                  kgWeight: double.parse('$_aimkg.$_aimkgDouble'),
                ),
              );
            });
          },
          onKgDoubleChange: (value) {
            setState(() {
              _aimkgDouble = value;
              Provider.of<RegisterForm>(context, listen: false)
                  .addPersonaimWeight(
                Weight(
                  lbWeight:
                      convertKgToLb(double.parse('$_aimkg.$_aimkgDouble')),
                  stLbWeight: convertKgToStoneLb(
                    double.parse('$_aimkg.$_aimkgDouble'),
                  ),
                  kgWeight: double.parse('$_aimkg.$_aimkgDouble'),
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
    return WeightInput(
      weightValueChanged: _showaimKgWeightPicker,
      weightText: '$_aimkg.$_aimkgDouble',
      heightType:'kg',
      isSettings: widget.isSettings,
    );
  }
}
