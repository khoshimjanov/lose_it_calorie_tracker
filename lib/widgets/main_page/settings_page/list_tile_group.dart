import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lose_it_calory_tracker/gen/assets.gen.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/settings_page.dart';

import 'package:lose_it_calory_tracker/screens/home_pages/settings_page/support_widget.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/settings_page/weight_change/custom_sliding_segmented_control.dart';

class ListTileGroup extends StatelessWidget {
  final Function(int value) heightValueChanged;
  final Function(int value) weightValueChanged;

  const ListTileGroup({
    super.key,
    required this.heightValueChanged,
    required this.weightValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const Divider(),
            ListTile(
                leading: SvgPicture.asset(Assets.icons.frame),
                title: const Text('Height unit'),
                trailing: SizedBox(
                  width: 120,
                  height: 30,
                  child: CustomSlidingSegmentedControl(
                    children: [HeightType.feet.message, HeightType.cm.message],
                    onValueChanged: heightValueChanged,
                  ),
                ),),
            const Divider(),
            ListTile(
              leading: SvgPicture.asset(Assets.icons.weightScale),
              title: const Text('Weight unit'),
              trailing: SizedBox(
                width: 160,
                height: 30,
                child: CustomSlidingSegmentedControl(
                  children: [
                    WeightType.lb.message,
                    WeightType.stLb.message,
                    WeightType.kg.message
                  ],
                  onValueChanged: weightValueChanged,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: SvgPicture.asset(Assets.icons.shieldDone),
              title: const Text('Privacy Police'),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right),),
            ),
            const Divider(),
            ListTile(
              leading: SvgPicture.asset(Assets.icons.termsOfUse),
              title: const Text('Terms of Use'),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.chevron_right),),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SupporPage.routeName);
              },
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.combinedShape),
                title: const Text('Support'),
                trailing:const Icon(Icons.chevron_right),
              ),
            ),
            const Divider(),
          ],),
        ),
      ),
    );
  }
}
