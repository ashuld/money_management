// ignore_for_file: use_build_context_synchronously
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/login/login.dart';
import 'package:money_management/screens/register/create.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});
  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}
class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: prColor),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/icons8-money-bag-100.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultTextStyle(
            style: const TextStyle(
                color: secColor, fontSize: 25.0, fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [WavyAnimatedText('BudgetBuddy')],
              isRepeatingAnimation: true,
            ),
          )
        ],
      ),
    ));
  }

 void  navigateToHome(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var loggedIn = prefs.getBool('isLogged');
    await Future.delayed(const Duration(milliseconds: 3500));
    if (loggedIn == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenCreateAccount(),
          ));
    }
  }
}