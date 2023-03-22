import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/widgets/widgets.dart';

Column termsBackground(BuildContext context) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        decoration: const BoxDecoration(
            color: prColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          children: [
            box30(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: secIcon(icon: Icons.arrow_back)),
                  secText600(data: 'Terms and Conditions', size: 20.0),
                  secIcon(icon: Icons.description)
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
