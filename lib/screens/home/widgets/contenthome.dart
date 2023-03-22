import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/calculations.dart';
import 'package:money_management/widgets/widgets.dart';

Widget welcome(key_) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        secText500(data: 'Welcome', size: 20.0),
        IconButton(
            onPressed: () {
              key_.currentState!.openEndDrawer();
            },
            icon: secIcon(icon: Icons.menu))
      ],
    ),
  );
}

Widget userName(name) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: customText(
          color: secColor,
          data: name ??= "User",
          size: 25.0,
          thickness: FontWeight.bold));
}

Widget totalBalance() {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Row(
      children: [
        Text(
          '₹ ${totaler()}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: totaler() < 0 ? expensecol : incomecol),
        )
      ],
    ),
  );
}

Widget balance() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '₹ ${incometotaler()}',
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: incomecol),
        ),
        Text(
          '₹ ${expensetotaler()}',
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: expensecol),
        ),
      ],
    ),
  );
}

Widget totalText() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Row(
      children: [prText500(data: 'Total Balance', size: 18.0)],
    ),
  );
}

Widget inexText() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 13,
                    backgroundColor: plain,
                    child: prIcon(icon: Icons.arrow_downward, size: 19.0)),
                prText500(data: 'Income', size: 16.0),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 13,
                    backgroundColor: plain,
                    child: prIcon(icon: Icons.arrow_upward, size: 19.0)),
                prText500(data: 'Expenses', size: 16.0)
              ],
            ),
          ],
        )
      ],
    ),
  );
}
