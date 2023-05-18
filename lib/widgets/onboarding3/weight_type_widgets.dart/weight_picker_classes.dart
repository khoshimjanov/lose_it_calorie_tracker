import 'package:flutter/material.dart';

import '../weight_picker_item.dart';

class ShowLBWeightPicker extends StatelessWidget {
  final Function(int value) action1;
  final Function(int value) action2;

  const ShowLBWeightPicker({
    super.key,
    required this.action1,
    required this.action2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          WeightPickerItem(
            valuelength: 151,
            addedvalue: 100,
            text: '.',
            action: action1,
          ),
          WeightPickerItem(
            valuelength: 10,
            addedvalue: 0,
            text: 'lb',
            action: action2,
          ),
        ],
      ),
    );
  }
}

class ShowStLbWeightPicker extends StatelessWidget {
  final Function(int value) action1;
  final Function(int value) action2;
  final Function(int value) action3;

  const ShowStLbWeightPicker({
    super.key,
    required this.action1,
    required this.action2,
    required this.action3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Row(
        children: [
          WeightPickerItem(
            valuelength: 50,
            addedvalue: 1,
            text: 'st',
            action: action1,
          ),
          WeightPickerItem(
            valuelength: 14,
            addedvalue: 0,
            text: '.',
            action: action2,
          ),
          WeightPickerItem(
              valuelength: 10, addedvalue: 0, text: 'lb', action: action3,),
        ],
      ),
    );
  }
}

class ShowKgWeightPicker extends StatelessWidget {
  final Function(int value) action1;
  final Function(int value) action2;

  const ShowKgWeightPicker({
    super.key,
    required this.action1,
    required this.action2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          WeightPickerItem(
            valuelength: 191,
            addedvalue: 30,
            text: '.',
            action: action1,
          ),
          WeightPickerItem(
            valuelength: 10,
            addedvalue: 0,
            text: 'kg',
            action: action2,
          ),
        ],
      ),
    );
  }
}
