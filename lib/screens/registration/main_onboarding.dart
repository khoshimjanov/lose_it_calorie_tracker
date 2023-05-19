import 'package:flutter/material.dart';
import 'package:lose_it_calory_tracker/provider/auth.dart';
import 'package:lose_it_calory_tracker/screens/home_pages/main_screen.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding1.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding2.dart';
import 'package:lose_it_calory_tracker/screens/registration/onboarding3.dart';
import 'package:lose_it_calory_tracker/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/register_form.dart';
import '../../widgets/main_onboarding/page_dots_widget.dart';
import '../../widgets/safe_area_widget.dart';

class MainOnboarding extends StatefulWidget {
  static const routeName = '/mainOnboarding';
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> { 
  final PageController _pageController = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final person = Provider.of<RegisterForm>(context).person;
    return Scaffold(
      body: Column(
        children: [
          SafeAreaWidget(
            action: () {
              if (_pageController.page == 0) {
                Navigator.of(context).pop();
              } else {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,);
              }
            },
          ),
          Expanded(
            flex: 2,
            child: PageView(
              
              allowImplicitScrolling: true,
              controller: _pageController,
              onPageChanged: (value) {
                _pageIndex = value;
                setState(() {});
              },
             
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OnboardingScreen1(),
                OnboardingScreen2(),
                OnboardingScreen3(),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PageDotsWidget(pageIndex: _pageIndex),
              ElevatedButtonWidget(
                text: 'Next',
                action: () {
                  
                  if (_pageController.page == 0) {
                    if (person.name == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "You haven't filled your name",
                          style: TextStyle(fontSize: 17),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                      ),);

                      return;
                    }
                    if (person.birthdate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "You haven't chosen your birthdate",
                          style: TextStyle(fontSize: 17),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                      ),);

                      return;
                    }
                  }
                  if (_pageController.page == 1) {
                    if (person.height == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "You haven't determined your height",
                          style: TextStyle(fontSize: 17),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                      ),);

                      return;
                      
                    }
                  }
                  if (_pageController.page == 2) {
                    if (person.weight == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "You haven't determined your weight",
                          style: TextStyle(fontSize: 17),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                      ),);

                      return;
                    }
                    if (person.aimweight == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "You haven't determined your aimweight",
                          style: TextStyle(fontSize: 17),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                      ),);

                      return;
                    }
                   
                    Provider.of<Auth>(context, listen: false).addPerson(person);
                    Provider.of<Auth>(context, listen: false).logIn();
                    Navigator.of(context).pushNamed(MainScreen.routeName);
                  }
                
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,);
                },
              ),
            ],
          ),)
        ],
      ),
    );
  }
}
