import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
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
              top: 120,
              child: spacePrivacy()
              )
          ],
        )
        ),
    );
  }
}