import 'package:flutter/material.dart';
import 'package:money_management/db/functions/colourfunctions/color.dart';
import 'package:money_management/screens/settings.dart';

Widget profileDrawer(context){
  return Drawer(
            elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: prColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secColor,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(
                        height: 10
                        ),
                      Text('5544545454511',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secColor,
                            fontSize: 14.0
                        ),
                      ),
                      SizedBox(
                        height: 10
                        ),
                      Text('email@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secColor,
                            fontSize: 14.0
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: prColor,
                ),
              title: const Text(
                'Settings', 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: prColor,
                  fontSize: 18)),
              onTap: () {
                Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder:(context) => ScreenSettings(), 
                    ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.close,
                color: prColor,
                ),
              title: const Text(
                'Close Drawer', 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: prColor,
                  fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
  );
}