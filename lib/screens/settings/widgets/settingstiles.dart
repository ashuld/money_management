import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/screens/settings/widgets/listtile.dart';
import 'package:money_management/widgets/widgets.dart';

Widget settingsTiles(context) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: plain),
    height: 550,
    width: 340,
    child: Column(
      children: [
        box30(),
        userUpdate(),
        box10(),
        dataReset(context),
        box10(),
        terms(context),
        box10(),
        privacy(context),
        box10(),
        about(context)
      ],
    ),
  );
}
