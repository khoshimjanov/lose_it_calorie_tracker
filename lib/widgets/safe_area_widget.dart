import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  final VoidCallback action;
  const SafeAreaWidget({super.key,required this.action});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: action,
                      icon:const Icon(Icons.arrow_back),),
                  TextButton(
                      style: const ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(86, 86, 86, 1),),),
                      onPressed: () {},
                      child: const Text(
                        "SKIP",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400,),
                      ),),
                ],
              ),
            ),
          );
  }
}
