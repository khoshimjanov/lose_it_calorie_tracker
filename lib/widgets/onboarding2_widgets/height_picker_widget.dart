import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/height.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/custom_sliding_segmented_control.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding2_widgets/height_input_widget.dart';
import 'package:lose_it_calory_tracker/widgets/onboarding3/weight_picker_item.dart';
import 'package:provider/provider.dart';

import '../../provider/register_form.dart';

class HeightPickerWidget extends StatefulWidget {
  const HeightPickerWidget({super.key});

  @override
  _HeightPickerWidgetState createState() => _HeightPickerWidgetState();
}

class _HeightPickerWidgetState extends State<HeightPickerWidget> {
  bool isCentimentre = true;
  int _selectedIndex = 0;

  // void _onSegmentTapped(int? index) {
  //   setState(() {
  //     _selectedIndex = index!;
  //     isCentimentre = !isCentimentre;
  //   });
  // }

  int convertFeetToCm(int feet, int inches) {
    final double totalInches = (feet * 12) + inches.toDouble();
    final double cm = totalInches * 2.54;
    return cm.toInt();
  }

  double convertCmToFeetInch(int cm) {
    final double totalInches = cm / 2.54;
    final int feet = (totalInches / 12).floor();
    final int inches = (totalInches % 12).round();

    return double.parse('$feet.$inches');
  }

  int _feet = 0;
  int _inches = 0;
  void _showFeetHeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final person = Provider.of<RegisterForm>(context, listen: false);
        return SizedBox(
          height: 200,
          child: Row(
            children: [
              WeightPickerItem(
                valuelength: 8,
                addedvalue: 3,
                text: 'feet',
                action: (value) {
                  setState(() {
                    _feet = value + 3;
                    person.addPersonHeight(
                      Height(
                        feetHeight: double.parse('$_feet.$_inches'),
                        cmHeight: convertFeetToCm(_feet, _inches),
                      ),
                    );
                  });
                },
              ),
              WeightPickerItem(
                valuelength: 12,
                addedvalue: 0,
                text: 'inches',
                action: (value) {
                  setState(() {
                    _inches = value;

                    person.addPersonHeight(
                      Height(
                        feetHeight: double.parse('$_feet.$_inches'),
                        cmHeight: convertFeetToCm(_feet, _inches),
                      ),
                    );
                  });
                },
              )
            ],
          ),
        );
      },
    );
  }

  int _heightInCm = 0;
  void _showCmHeightPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final person = Provider.of<RegisterForm>(context, listen: false);
        return SizedBox(
          height: 200,
          child: Row(
            children: [
              WeightPickerItem(
                valuelength: 301,
                addedvalue: 50,
                text: 'cm',
                action: (value) {
                  setState(() {
                    _heightInCm = value + 50;
                  });

                  person.addPersonHeight(
                    Height(
                      feetHeight: convertCmToFeetInch(_heightInCm),
                      cmHeight: _heightInCm,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('Choose a unit of measure for height'),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomSlidingSegmentedControl(
                  children: const [
                    'ft/n',
                    'cm',
                  ],
                  onValueChanged: (value) {
                    _selectedIndex = value;
                    isCentimentre = !isCentimentre;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        if (isCentimentre)
          HeightInput(
            action: () {
              _showFeetHeightPicker();
            },
            text: '$_feet\' $_inches"',
            heightType: 'ft/in',
          )
        else
          HeightInput(
            action: _showCmHeightPicker,
            text: '$_heightInCm',
            heightType: 'cm',
          )
      ],
    );
  }
}