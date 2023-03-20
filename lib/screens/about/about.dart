import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/screens/about/widgets/aboutbg.dart';
import 'package:money_management/screens/about/widgets/whitespaceab.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            aboutBackground(context),
            Positioned(
              top: 120,
              child: spaceAbout()
              )
          ],
        )
        ),
    );
  }
}