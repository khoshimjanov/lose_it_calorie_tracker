import 'package:flutter/cupertino.dart';

class WeightTypeWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int? value) action;
  const WeightTypeWidget(
      {super.key, required this.selectedIndex, required this.action,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Choose a unit of measure for weight'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(5),
                  children: const {
                    0: Text(
                      'lb',
                    ),
                    1: Text('st/lb'),
                    3: Text('kg'),
                  },
                  groupValue: selectedIndex,
                  onValueChanged: action,
                  backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
                ),),
          ),
        ],
      ),
    );
  }
}
