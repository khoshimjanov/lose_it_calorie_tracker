import 'package:flutter/material.dart';

import '../onboarding1_widgets/page_dot_widget.dart';

class PageDotsWidget extends StatelessWidget {
  final int pageIndex;
  const PageDotsWidget({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageDotWidget(
            isSelected: pageIndex == 0,
          ),
          PageDotWidget(
            isSelected: pageIndex == 1,
          ),
          PageDotWidget(
            isSelected: pageIndex == 2,
          ),
        ],
      ),
    );
  }
}
