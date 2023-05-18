import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoIconWidget extends StatelessWidget {
  final String icon;
  final String text;
  const InfoIconWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 20,
      contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: SvgPicture.asset(icon, width: 40),
      title: Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }
}
