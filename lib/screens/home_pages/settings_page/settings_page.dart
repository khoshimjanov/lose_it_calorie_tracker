import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/main_page_safe_area.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/settings_page/list_tile_group.dart';

import '../../../widgets/main_page/settings_page/personal_info.dart';

enum HeightType {
  feet('ft/in'),
  cm('cm');

  const HeightType(this.message);
  final String message;
}

enum WeightType {
  lb('lb'),
  stLb('st/lb'),
  kg('kg');

  const WeightType(this.message);
  final String message;
}

HeightType heightType = HeightType.feet;

WeightType weightType = WeightType.lb;

class Settings extends StatefulWidget {
  static const routeName = '/Settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MainPageSafeArea(text: 'Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PersonalInfo(heightType: heightType, weightType: weightType),
            ListTileGroup(
              heightValueChanged: (value) {
                if (value == 0) {
                  heightType = HeightType.feet;
                } else {
                  heightType = HeightType.cm;
                }
                setState(() {});
              },
              weightValueChanged: (value) {
                if (value == 0) {
                  weightType = WeightType.lb;
                } else if (value == 1) {
                  weightType = WeightType.stLb;
                } else {
                  weightType = WeightType.kg;
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
