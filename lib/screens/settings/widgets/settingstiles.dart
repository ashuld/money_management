import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/settings/widgets/listtile.dart';
import 'package:money_management/widgets/widgets.dart';

Widget settingsTiles(context,{required UserModel userlist}) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: plain),
    height: MediaQuery.of(context).size.height * .68,
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
      children: [
        box30(),
        userUpdate(context,user: userlist),
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
