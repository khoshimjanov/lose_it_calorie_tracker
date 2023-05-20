import 'package:flutter/material.dart';

import '../weight_picker_item.dart';

class ShowLBWeightPicker extends StatelessWidget {
  final Function(int value) onLbChange;
  final Function(int value) onPoundChange;

  const ShowLBWeightPicker({
    super.key,
    required this.onLbChange,
    required this.onPoundChange,
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
            action: onLbChange,
          ),
          WeightPickerItem(
            valuelength: 10,
            addedvalue: 0,
            text: 'lb',
            action: onPoundChange,
          ),
        ],
      ),
    );
  }
}

class ShowStLbWeightPicker extends StatelessWidget {
  final Function(int value) onStChange;
  final Function(int value) onLbChange;
  final Function(int value) onPoundchange;

  const ShowStLbWeightPicker({
    super.key,
    required this.onStChange,
    required this.onLbChange,
    required this.onPoundchange,
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
            action: onStChange,
          ),
          WeightPickerItem(
            valuelength: 14,
            addedvalue: 0,
            text: '.',
            action: onLbChange,
          ),
          WeightPickerItem(
              valuelength: 10, addedvalue: 0, text: 'lb', action: onPoundchange,),
        ],
      ),
    );
  }
}

class ShowKgWeightPicker extends StatelessWidget {
  final Function(int value) onKgChange;
  final Function(int value) onKgDoubleChange;

  const ShowKgWeightPicker({
    super.key,
    required this.onKgChange,
    required this.onKgDoubleChange,
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
            action: onKgChange,
          ),
          WeightPickerItem(
            valuelength: 10,
            addedvalue: 0,
            text: 'kg',
            action: onKgDoubleChange,
          ),
        ],
      ),
    );
  }
}
