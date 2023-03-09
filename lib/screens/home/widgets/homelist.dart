import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/db/model/listdata.dart';

Widget homeList(index){
return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          geter()[index].image!,
                          height: 40,
                          ),
                      ),
                      title:  Text(
                        geter()[index].name!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                        subtitle:  Text(
                        geter()[index].time!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                        trailing:  Text(
                          geter()[index].fee!,
                          style: TextStyle(
                            color: geter()[index].type! ? incomecol : expensecol,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                    );
}