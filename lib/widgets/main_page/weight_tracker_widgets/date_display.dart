import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(Assets.icons.arrowLeftCircle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(Assets.icons.arrowRightCircle),
              ),
            ],
          )
        ],
      ),
    );
  }
}
