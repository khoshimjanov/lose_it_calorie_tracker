import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import '../provider/register_form.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<Auth>(context).person?.name;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Your name'),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: name == null || name == ''
                  ? const Color.fromRGBO(240, 240, 240, 1)
                  : const Color.fromRGBO(229, 229, 229, 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              onChanged: (value) {
                if (value.isEmpty) {
                  value = ' ';
                }
                Provider.of<RegisterForm>(context, listen: false).addPersonName(
                  value.replaceFirst(value[0], value[0].toUpperCase()),
                );
              },
              initialValue: name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
