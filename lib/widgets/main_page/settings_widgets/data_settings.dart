import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/helper/app_styles.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/provider/register_form.dart';
import 'package:lose_it_calory_tracker/widgets/custom_button.dart';
import 'package:lose_it_calory_tracker/widgets/main_page/settings_widgets/weight_change/weight_height_change.dart';
import 'package:lose_it_calory_tracker/widgets/date_input.dart';
import 'package:lose_it_calory_tracker/widgets/gender_input.dart';
import 'package:lose_it_calory_tracker/widgets/name_input.dart';
import 'package:provider/provider.dart';

class DataSettings extends StatefulWidget {
  const DataSettings({super.key});

  @override
  State<DataSettings> createState() => _DataSettingsState();
}

class _DataSettingsState extends State<DataSettings> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text('')),
                const Expanded(
                  flex: 4,
                  child: Align(
                    child: Text(
                      'Personal Data',
                      style: AppStyles.titleStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            ),
          ),
          const NameInput(),
          const DateInput(),
          const GenderInput(),
          const WeightHeightChange(),
          const SubmitButton()
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomButton(
        text: 'SAVE',
        action: () {
          Navigator.of(context).pop();
          Provider.of<Auth>(context, listen: false).update(
            Provider.of<RegisterForm>(context, listen: false).person,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color.fromARGB(255, 129, 127, 127),
              content: Text('Data is modified'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
