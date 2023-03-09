import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/privacy/widgets/contentpr.dart';

Widget spacePrivacy(){
  return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: plain,
                ),
                height: 550,
                width: 340,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 320,
                      height: 530,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        )
                      ),
                      child: contentPrivacy(),
                    ),
                  ],
                )
              );
}