import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/screens/search/search.dart';
import 'package:money_management/widgets/widgets.dart';

Widget transactionHead(BuildContext ctx) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: MediaQuery.of(ctx).size.width,
            height: MediaQuery.of(ctx).size.height * .22,
            decoration: const BoxDecoration(
                color: prColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Column(
              children: [
                Column(
                  children: [
                    customBox(height: 17.0),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(ctx);
                                },
                                child: secIcon(icon: Icons.arrow_back)),
                            secText600(data: 'Transactions', size: 20.0),
                            secIcon(icon: Icons.money)
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: MediaQuery.of(ctx).size.height * .1,
        left: MediaQuery.of(ctx).size.width * .05,
        right: MediaQuery.of(ctx).size.width * .05,
        child: InkWell(
          onTap: () {
            showSearch(context: ctx, delegate: ScreenSearch());
          },
          child: Container(
              height: MediaQuery.of(ctx).size.height * .066,
              decoration: BoxDecoration(
                  color: secColor, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search',
                      style: TextStyle(
                          color: prColor, fontWeight: FontWeight.bold),
                    ),
                    prIcon(icon: Icons.search)
                  ],
                ),
              )),
        ),
      )
    ],
  );
}
