import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/provider/register_form.dart';
import 'package:lose_it_calory_tracker/screens/subscription_screen.dart';
import 'package:provider/provider.dart';

class SupportPage extends StatelessWidget {
  static const routeName = '/SupportPage';
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Support'),
      ),
      body: Center(
        child: CupertinoButton(
          child: const Text('Log out'),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              content: const Text('Do you want to log out?'),
              actions: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    return;
                  },
                  child: const Text('No'),
                ),
                CupertinoButton(
                  onPressed: () {
                    Provider.of<Auth>(context, listen: false).logOut();
                    Provider.of<RegisterForm>(context, listen: false).logOut();

                    Navigator.of(context)
                        .pushNamed(SubscriptionScreen.routeName);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
