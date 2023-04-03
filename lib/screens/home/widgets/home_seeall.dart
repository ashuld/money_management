import 'package:flutter/material.dart';
import 'package:money_management/screens/transactions/all.dart';
import 'package:money_management/widgets/widgets.dart';

Widget homeSeeall(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        prText600(data: 'Recent Transactions', size: 17.0),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenTransactions(),
                  ));
            },
            child: customText(data: 'See All', color: Colors.blue.shade500, size: 15.0, thickness: FontWeight.bold))
      ],
    ),
  );
}
