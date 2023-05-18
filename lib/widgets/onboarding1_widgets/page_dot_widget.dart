import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';

class PageDotWidget extends StatelessWidget {
  final bool isSelected;
  const PageDotWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: isSelected
            ? SvgPicture.asset(Assets.icons.redEllipse)
            : SvgPicture.asset(Assets.icons.ellipse));
  }
}
