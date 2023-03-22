import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/widgets/widgets.dart';

Widget spaceAbout(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: plain,
    ),
    height: MediaQuery.of(context).size.height * .68,
    width: MediaQuery.of(context).size.width * 0.9,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 530,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "BudgetBuddy",
              style: TextStyle(
                  color: prColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            box10(),
            prText500(data: 'Version 0.0.1'),
            box10(),
            const Text(
              'Developed By Ashish',
              style: TextStyle(
                color: prColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
