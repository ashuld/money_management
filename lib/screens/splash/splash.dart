import 'package:flutter/material.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/screens/login/login.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}
 late String userr;
class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context);
    userr =name();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 51, 60, 141)
        ),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage(
                  'assets/images/icons8-money-bag-100.png'
                  ),
                fit: BoxFit.fill
                  )
            ),
          ),
        ),
      )
    );
  }

  navigateToHome(BuildContext context) async {
   var prefs = await SharedPreferences.getInstance();
   var loggedIn = prefs.getBool('isLogged');
   await Future.delayed(const Duration(seconds: 3));
   if (loggedIn == true) {
     // ignore: use_build_context_synchronously
     Navigator.pushReplacement(
          context,
         MaterialPageRoute(
            builder: (context) =>const BottomNavigation(),
         ));
   } else {
    //  ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
         MaterialPageRoute(
            builder: (context) => const ScreenLogIn(),
         ));
   }
    }
}