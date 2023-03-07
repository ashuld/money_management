import 'package:flutter/material.dart';

Column createBackground(BuildContext context){
  return Column(
              children: [
                Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 51, 60, 141),
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
                          const Visibility(
                            visible: false,
                            child: Text('')),
                            Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo[50]
                              ),
                              ),
                              Icon(Icons.app_registration,
                              color: Colors.indigo[50],
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