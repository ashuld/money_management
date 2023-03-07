import 'package:flutter/material.dart';
import '../db/functions/colourfunctions/color.dart';

Widget transactionHead(BuildContext ctx){
  return Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 51, 60, 141),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                    )
                  ),
                  child: Column(
                    children: [
                      Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                                Navigator.pop(ctx);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.indigo[50],
                            ),
                          ),
                            Text(
                              'Transactions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo[50]
                              ),
                              ),
                              Icon(Icons.money,
                              color: Colors.indigo[50],
                              )
                        ],
                      ),
                    )
                  ],
                ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
              top: 60,
              left: 37,
              child: Container(
                height: 170,
                width: 320,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 51, 60, 141),
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
                            color: Color.fromARGB(255, 51, 60, 141),
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
                              color: Colors.green
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
                                      color:  Color.fromARGB(255, 51, 60, 141),
                                      size: 19,),
                                  ),
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                    color: Color.fromARGB(255, 51, 60, 141),
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
                                      color:  Color.fromARGB(255, 51, 60, 141),
                                      size: 19,),
                                  ),
                                  Text(
                                    'Expenses',
                                    style: TextStyle(
                                    color: Color.fromARGB(255, 51, 60, 141),
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
                              color: Colors.green
                            ),
                            ),
                            Text(
                            '₹ 500',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.red
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