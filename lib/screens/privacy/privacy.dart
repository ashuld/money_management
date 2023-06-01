import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/screens/privacy/widgets/privacybg.dart';
import 'package:money_management/screens/privacy/widgets/spacepr.dart';

class ScreenPrivacy extends StatelessWidget {
  const ScreenPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            privacyBackground(context),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              child: spacePrivacy(context)
              )
          ],
        )
        ),
    );
  }
}