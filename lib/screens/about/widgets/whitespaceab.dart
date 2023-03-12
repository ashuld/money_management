import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';

Widget spaceAbout(){
  return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: plain,
                ),
                height: 550,
                width: 340,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 530,
                    width: 300,
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Money Mate",
                        style: TextStyle(
                          color: prColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Version 0.0.1',
                        style: TextStyle(
                          color: prColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
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