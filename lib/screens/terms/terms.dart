import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/screens/terms/widgets/spaceterms.dart';
import 'package:money_management/screens/terms/widgets/termsbg.dart';

class ScreenTerms extends StatelessWidget {
  const ScreenTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            termsBackground(context),
            Positioned(
              top: 120,
              child: spaceTerms()
              )
          ],
        )
        ),
    );
  }
}