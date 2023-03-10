import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';

Column termsBackground(BuildContext context){
  return Column(
              children: [
                Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  color: prColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
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
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back,
                                color: secColor,
                                ),
                          ),
                            const Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: secColor
                              ),
                              ),
                              const Icon(Icons.description,
                              color: secColor,
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ],
            );
}