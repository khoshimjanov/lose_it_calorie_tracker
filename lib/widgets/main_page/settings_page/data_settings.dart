import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/settings_page.dart';
import 'package:lose_it_calory_tracker/widgets/elevated_button_widget.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/date_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/gender_input.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding1_widgets/name_input.dart';
import 'package:provider/provider.dart';

import '../../../provider/register_form.dart';
import '../../../provider/st_lb.dart';
import '../../../provider/weight.dart';
import '../../onboarding3/weight_type_widgets.dart/weight_picker_classes.dart';

class DataSettings extends StatefulWidget {
  const DataSettings({super.key});

  @override
  State<DataSettings> createState() => _DataSettingsState();
}

class _DataSettingsState extends State<DataSettings> {
  int _lb = 0;
  int _lbDouble = 0;

  double convertLbToKg(double lb) {
    double kg = double.parse((lb * 0.453592).toStringAsFixed(1));
    return kg;
  }

  StLb convertLbToStoneLb(double lb) {
    int stone = (lb / 14).floor();
    double pounds = double.parse((lb % 14).toStringAsFixed(1));
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
                  kgWeight: convertLbToKg(double.parse('$_lb.$_lbDouble')),
                ),
              );
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
                  kgWeight: convertLbToKg(double.parse('$_lb.$_lbDouble')),
                ),
              );
            });
          },
        );
      },
    );
  }

  int _kg = 0;
  int _kgDouble = 0;

  StLb convertKgToStoneLb(double kg) {
    double totalLb = kg * 2.20462;
    int stone = (totalLb / 14).floor();
    double pounds = double.parse((totalLb % 14).toStringAsFixed(1));
    return StLb(stone: stone, lb: pounds);
  }

  double convertKgToLb(double kg) {
    double lb = double.parse((kg * 2.20462).toStringAsFixed(1));

    return lb;
  }

  void _showKgWeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowKgWeightPicker(
          action1: (value) {
            setState(() {
              _kg = value + 30;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertKgToLb(double.parse('$_kg.$_kgDouble')),
                  stLbWeight:
                      convertKgToStoneLb(double.parse('$_kg.$_kgDouble')),
                  kgWeight: double.parse('$_kg.$_kgDouble'),
                ),
              );
            });
          },
          action2: (value) {
            setState(() {
              _kgDouble = value;
              Provider.of<RegisterForm>(context, listen: false).addPersonWeight(
                Weight(
                  lbWeight: convertKgToLb(double.parse('$_kg.$_kgDouble')),
                  stLbWeight:
                      convertKgToStoneLb(double.parse('$_kg.$_kgDouble')),
                  kgWeight: double.parse('$_kg.$_kgDouble'),
                ),
              );
            });
          },
        );
      },
    );
  }

  int _st = 0;
  int _stLb = 0;
  int _stLbDouble = 0;

  double convertStonePoundsToLb(int stones, double pounds) {
    double lb = double.parse(((stones * 14) + pounds).toStringAsFixed(1));
    return lb;
  }

  double convertStonePoundsToKg(int stones, double pounds) {
    double lb = (stones * 14) + pounds;
    double kg = double.parse((lb * 0.45359237).toStringAsFixed(1));
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
    // final person = Provider.of<RegisterForm>(context).person.birthdate;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('')),
                Expanded(child: Text('Personal Data')),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                )
              ],
            ),
          ),
          NameInput(),
          DateInput(
          // birthdate: Provider.of<Auth>(context).person!.birthdate,
          ),
          GenderInput(),
          HeightWeightChange(
            valueChanged: weightType == WeightType.lb
                ? _showLBWeightPicker
                : (weightType == WeightType.stLb
                    ? _showStLbWeightPicker
                    : _showKgWeightPicker),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButtonWidget(
              text: 'SAVE',
              action: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 129, 127, 127),
                    content: Text('Data is modified'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class HeightWeightChange extends StatelessWidget {
  final VoidCallback valueChanged;
  const HeightWeightChange({super.key, required this.valueChanged});

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Auth>(context).person!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Your height, ${heightType == HeightType.feet ? HeightType.feet.message : HeightType.cm.message}',
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          heightType == HeightType.feet
                              ? person.height!.feetHeight.toString()
                              : person.height!.cmHeight.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Your weight, ${weightType == WeightType.lb ? WeightType.lb.message : (weightType == WeightType.stLb ? WeightType.stLb.message : WeightType.kg.message)}',
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: valueChanged,
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          weightType == WeightType.lb
                              ? "${person.weight!.lbWeight}"
                              : (weightType == WeightType.stLb
                                  ? "${person.weight!.stLbWeight.stone} ${person.weight!.stLbWeight.lb}"
                                  : "${person.weight!.kgWeight}"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Text(
                        'Goal weight, ${weightType == WeightType.lb ? WeightType.lb.message : (weightType == WeightType.stLb ? WeightType.stLb.message : WeightType.kg.message)}',
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          weightType == WeightType.lb
                              ? "${person.aimweight!.lbWeight}"
                              : (weightType == WeightType.stLb
                                  ? "${person.aimweight!.stLbWeight.stone} ${person.aimweight!.stLbWeight.lb}"
                                  : "${person.aimweight!.kgWeight}"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Text(''))
            ],
          )
        ],
      ),
    );
  }
}
