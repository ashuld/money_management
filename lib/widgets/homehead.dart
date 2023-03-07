import 'package:flutter/material.dart';
import '../db/functions/colourfunctions/color.dart';

Widget head(context){
  return Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: prColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                    )
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  const Text('Welcome',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: secColor,
                                  ),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      key_.currentState!.openEndDrawer();
                                    }, 
                                    icon: const Icon(Icons.menu,
                                    color: secColor,
                                    ),
                                    )
                                ],
                              ),
                            ),
                            const Padding(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 15
                              ),
                              child: Text('User',
                              style: TextStyle(
                                color: secColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 130,
              left: 37,
              child: Container(
                height: 170,
                width: 320,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: prColor,
                      offset: Offset(0, 6),
                      blurRadius: 12,
                      spreadRadius: 1
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: const [
                           Text('Total Balance',
                          style: TextStyle(
                            color: prColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15
                      ),
                      child: Row(
                        children: const [
                           Text(
                            '₹ 3000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: incomecol
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            children:  [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:  Colors.white,
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color:  prColor,
                                      size: 19,),
                                  ),
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                    color: prColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                    ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children:  [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:  Colors.white,
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color:  prColor,
                                      size: 19,),
                                  ),
                                  Text(
                                    'Expenses',
                                    style: TextStyle(
                                    color: prColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                    ),
                                    ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '₹ 3500',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: incomecol
                            ),
                            ),
                            Text(
                            '₹ 500',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: expensecol
                            ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
}