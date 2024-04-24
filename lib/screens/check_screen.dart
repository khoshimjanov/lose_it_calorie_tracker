import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/screens/subscription_screen.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import '../provider/foods.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Provider.of<Auth>(context, listen: false).getData(),
        Provider.of<Foods>(context, listen: false).getNewFoods(),
      ]),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SubscriptionScreen(),
    );
  }
}
