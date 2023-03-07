import 'package:flutter/material.dart';
import 'package:money_management/screens/home.dart';
import 'package:money_management/screens/login.dart';
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
    //ignore: unused_local_variable, non_constant_identifier_names
   var LoggedIn = prefs.getBool('IsLogged');
   await Future.delayed(const Duration(seconds: 3));
   if (LoggedIn == true) {
     // ignore: use_build_context_synchronously
     Navigator.pushReplacement(
          context,
         MaterialPageRoute(
            builder: (context) =>ScreenHome(),
         ));
   } else {
    //  ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
         MaterialPageRoute(
            builder: (context) => const ScreenLogIn(),
         ));
   }
     // ignore: use_build_context_synchronously
    
    }
 // }
}