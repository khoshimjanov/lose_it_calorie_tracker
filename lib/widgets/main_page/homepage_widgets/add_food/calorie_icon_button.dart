import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';

class CalorieIconButton extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onTapped;

  const CalorieIconButton({
    super.key,
    required this.imageAsset,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){ onTapped();
      // Navigator.of(context).popAndPushNamed();
      
      },
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: imageAsset == Assets.icons.remove
            ? const EdgeInsets.symmetric(horizontal: 5, vertical: 8)
            : const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromRGBO(230, 230, 230, 1),
        ),
        child: SvgPicture.asset(
          imageAsset,
        ),
      ),
    );
  }
}
