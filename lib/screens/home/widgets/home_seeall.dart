import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/transactions/all.dart';

Widget homeSeeall(BuildContext context){
  return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text('Transactions History',
                      style: TextStyle(
                        color:  prColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const ScreenTransactions(),)
                            );
                        },
                        child: const Text('See All',
                        style: TextStyle(
                          color:  unselected,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      )
                    ],
                  ),
                );
}