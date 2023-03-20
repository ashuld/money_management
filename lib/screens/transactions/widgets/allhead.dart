import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/screens/search/search.dart';

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
                    const SizedBox(
                      height: 17,
                    ),
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
                            child: const Icon(
                              Icons.arrow_back,
                              color: secColor,
                            ),
                          ),
                          const Text(
                            'Transactions',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: secColor),
                          ),
                          const Icon(
                            Icons.money,
                            color: secColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 75,
        left: 15,
        right: 15,
        child: InkWell(
          onTap: () {
            showSearch(context: ctx, delegate: ScreenSearch());
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(color: secColor, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Search',
                  style: TextStyle(
                    color: prColor,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Icon(Icons.search,
                  color: prColor,
                  )
                ],
              ),
            )
          ),
        ),
      )
    ],
  );
}
