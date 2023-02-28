import 'package:flutter/material.dart';
import 'package:money_management/screens/home.dart';
import 'package:money_management/screens/signin.dart';
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
    navigateTohome(context);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(73, 29, 139, 0.666),
      body: Center(
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
      )
    );
  }

  navigateTohome(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var loggedIn = prefs.getBool('isSignedIn');
    await Future.delayed(const Duration(seconds: 3));
    if (loggedIn == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenHome(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenSignIn(),
          ));
    }
  }
}