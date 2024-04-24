import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth.dart';
import '../../../../provider/register_form.dart';
import '../../../../model/weight.dart';
import '../../../onboarding3/weight_choose_types/weight_kg_show.dart';

class WeightChangeDialog extends StatelessWidget {
  const WeightChangeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('What is your weight today?'),
      content: Column(
        children: [
          const Text(
            'Weigh yourself in the morning after waking up before eating',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: CupertinoTextField(
              onChanged: (value) {
                if (value.isEmpty || value == ' ') return;

                Provider.of<RegisterForm>(
                  context,
                  listen: false,
                ).addPersonWeight(
                  Weight(
                    lbWeight: double.parse(
                      (int.parse(value) * 2.20462).toStringAsFixed(1),
                    ),
                    stLbWeight: WeightKgWidget.convertKgToStoneLb(
                      double.parse('$value.0'),
                    ),
                    kgWeight: double.parse('$value.0'),
                  ),
                );
              },
              placeholder: 'Your weight today',
              keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
      actions: [
        CupertinoButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        CupertinoButton(
          onPressed: () {
            Provider.of<Auth>(context, listen: false).update(
              Provider.of<RegisterForm>(
                context,
                listen: false,
              ).person,
            );
            
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
