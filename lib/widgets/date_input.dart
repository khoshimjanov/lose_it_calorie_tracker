import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/register_form.dart';

class DateInput extends StatefulWidget {
  const DateInput({
    super.key,
  });

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? dateController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text('Date of Birth'),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              BottomPicker.date(
                dismissable: true,
                maxDateTime: DateTime.now(),
                minDateTime:
                    DateTime.now().subtract(const Duration(days: 36600 * 2)),
                onChange: (date) {
                  dateController = date as DateTime;

                  Provider.of<RegisterForm>(context, listen: false)
                      .addPersonBirthday(date);
                  setState(() {});
                },
                displaySubmitButton: false,
                title: 'Pick your birthdate',
                dateOrder: DatePickerDateOrder.mdy,
                pickerTextStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ).show(context);
            },
            child: Ink(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: dateController == null
                    ? const Color.fromRGBO(240, 240, 240, 1)
                    : const Color.fromRGBO(229, 229, 229, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Provider.of<RegisterForm>(context).person.birthdate != null
                        ? DateFormat('dd/MM/yyyy').format(
                            Provider.of<RegisterForm>(context)
                                .person
                                .birthdate!,
                          )
                        : 'dd/mm/yyyy',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
