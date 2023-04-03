import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
// import 'package:money_management/screens/login/login.dart';
import 'package:money_management/screens/settings/settings.dart';
import 'package:money_management/widgets/widgets.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Widget header(name, phnno, mail) {
  return DrawerHeader(
    decoration: const BoxDecoration(color: prColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                data: name,
                thickness: FontWeight.bold,
                color: secColor,
                size: 25.0),
            box10(),
            secText500(data: phnno, size: 14.0),
            box10(),
            secText500(data: mail, size: 14.0),
            box10(),
          ],
        )
      ],
    ),
  );
}

// Widget tile1(context) {
//   return ListTile(
//       leading: prIcon(icon: Icons.logout_outlined),
//       title: prText400(data: 'Log Out', size: 18.0),
//       onTap: () async {
//         var prefs = await SharedPreferences.getInstance();
//         prefs.setBool('isLogged', false);
//         Navigator.pop(context);
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const ScreenLogIn(),
//             ));
//       });
// }

Widget tile2(context, userlist) {
  return ListTile(
      leading: prIcon(icon: Icons.settings),
      title: prText500(data: 'Settings', size: 18.0),
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>   ScreenSettings(userdatalist: userlist),
        ));
      });
}

Widget tile3(context) {
  return ListTile(
    leading: prIcon(icon: Icons.close),
    title: prText500(data: 'Close Drawer', size: 18.0),
    onTap: () {
      Navigator.of(context).pop();
    },
  );
}
