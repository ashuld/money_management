import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';

Widget settingsTiles(){
  return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  plain
                ),
                height: 550,
                width: 340,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.manage_accounts,
                        size: 30,
                        color: prColor
                        ),
                        title: Center(
                          child: Text(
                            'Update User Details',
                            style: TextStyle(
                              color: prColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.currency_exchange,
                        size: 30,
                        color: prColor
                        ),
                        title: Center(
                          child: Text(
                            'Change Currency',
                            style: TextStyle(
                              color: prColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.description,
                        size: 30,
                        color: prColor
                        ),
                        title: Center(
                          child: Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              color: prColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip,
                        size: 30,
                        color: prColor
                        ),
                        title: Center(
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: prColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        leading: Icon(Icons.info_outline_rounded,
                        size: 30,
                        color: prColor
                        ),
                        title: Center(
                          child: Text(
                            'About',
                            style: TextStyle(
                              color: prColor,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              );
}