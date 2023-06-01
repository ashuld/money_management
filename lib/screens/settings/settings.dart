import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/settings/widgets/settingsbackground.dart';
import 'package:money_management/screens/settings/widgets/settingstiles.dart';

class ScreenSettings extends StatefulWidget {

  const ScreenSettings({super.key, required this.userdatalist,});
   final UserModel  userdatalist;

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:secColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            settingsBackground(context),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              child: settingsTiles(context, userlist: widget.userdatalist)
              )
          ],
        )
        ),
    );
  }
}