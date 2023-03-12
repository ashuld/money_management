import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/about/about.dart';
import 'package:money_management/screens/privacy/privacy.dart';
import 'package:money_management/screens/terms/terms.dart';

Widget settingsTiles( context){
  return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  plain
                ),
                height: 550,
                width: 340,
                child: Column(
                  children:  [
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
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
                    const SizedBox(
                      height: 10,
                    ),
                     Padding(
                      padding:  const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const ScreenTerms(),)), 
                        leading: const Icon(Icons.description,
                        size: 30,
                        color: prColor
                        ),
                        title: const Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const ScreenPrivacy(), 
                              ));
                        },
                        leading: const Icon(Icons.privacy_tip,
                        size: 30,
                        color: prColor
                        ),
                        title: const Center(
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
                    const SizedBox(
                      height: 10,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const ScreenAbout(),)),
                        leading: const Icon(Icons.info_outline_rounded,
                        size: 30,
                        color: prColor
                        ),
                        title: const Center(
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