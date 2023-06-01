import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/about/about.dart';
import 'package:money_management/screens/edituser/edituser.dart';
import 'package:money_management/screens/privacy/privacy.dart';
import 'package:money_management/screens/splash/splash.dart';
import 'package:money_management/screens/terms/terms.dart';
import 'package:money_management/widgets/widgets.dart';

Widget userUpdate(context,{required UserModel user}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) =>   EditUser(userdatalist: user,)));
        },
          leading: prIcon(icon: Icons.manage_accounts, size: 30.0),
          title: prText600(data: 'Update User Details')));
}

Widget dataReset(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: ListTile(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: secColor,
                  title: const Text(
                    'Are You Sure?',
                    style: TextStyle(
                        color: prColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: prText400(data: 'No')),
                    TextButton(
                        onPressed: () {
                          reset();
                          refreshTransaction();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenSplash()));
                        },
                        child: prText400(data: 'Yes')),
                  ],
                );
              });
        },
        leading: prIcon(size: 30.0, icon: Icons.refresh_outlined),
        title: prText600(data: 'Reset Data')),
  );
}

Widget terms(context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScreenTerms())),
          leading: prIcon(size: 30.0, icon: Icons.description),
          title: prText600(data: 'Terms and Conditions')));
}

Widget privacy(context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScreenPrivacy()));
          },
          leading: prIcon(size: 30.0, icon: Icons.privacy_tip),
          title: prText600(data: 'Privacy Policy')));
}

Widget about(context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAbout(),
              )),
          leading: prIcon(size: 30.0, icon: Icons.info_outline_rounded),
          title: prText600(data: 'About')));
}
