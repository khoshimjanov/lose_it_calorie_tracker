import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import 'data_settings.dart';

class ShowDataSettings extends StatelessWidget {
  const ShowDataSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const SingleChildScrollView(child: DataSettings()),
            ),
          );
        },
        icon: SvgPicture.asset(
          Assets.icons.moreVert,
          // ignore: deprecated_member_use
          color: const Color.fromRGBO(86, 86, 86, 1),
        ),
      ),
    );
  }
}
