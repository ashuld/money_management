// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/functions/calculations.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/home/widgets/home_seeall.dart';
import 'package:money_management/screens/home/widgets/homelist.dart';
import 'package:money_management/screens/login/login.dart';
import 'package:money_management/screens/register/create.dart';
import 'package:money_management/screens/settings/settings.dart';
import 'package:money_management/screens/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var name;
  var phnno;
  var mail;
  final GlobalKey<ScaffoldState> key_ = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // notify();
    notify();
    final box = Hive.box<TransactionModel>(transactiondb);
    return SafeArea(
      child: Scaffold(
        key: key_,
        endDrawer: Drawer(
          elevation: 10.0,
          child: ValueListenableBuilder(
              valueListenable: usernotifier,
              builder: (BuildContext context, List<UserModel> userlist,
                  Widget? child) {
                for (var element in userlist) {
                  name = element.name;
                  phnno = element.phn;
                  mail = element.mail;
                }
                return ListView(
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(color: prColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: secColor,
                                    fontSize: 25),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                phnno,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: secColor,
                                    fontSize: 14.0),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                mail,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: secColor,
                                    fontSize: 14.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: prColor,
                      ),
                      title: const Text(
                        'Log Out',
                        style: TextStyle(color: prColor, fontSize: 18),
                      ),
                      onTap: () async {
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isLogged', false);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenLogIn(),
                            ));
                      },
                    ),
                    const Divider(height: 3.0),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: prColor,
                      ),
                      title: const Text('Settings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: prColor,
                              fontSize: 18)),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScreenSettings(),
                        ));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.close,
                        color: prColor,
                      ),
                      title: const Text('Close Drawer',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: prColor,
                              fontSize: 18)),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }),
        ),
        backgroundColor: secColor,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                    height: 330,
                    child: Stack(
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
                                      bottomRight: Radius.circular(40))),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10),
                                    child: ListView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Welcome',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: secColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  key_.currentState!
                                                      .openEndDrawer();
                                                },
                                                icon: const Icon(
                                                  Icons.menu,
                                                  color: secColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ValueListenableBuilder(
                                          valueListenable: usernotifier,
                                          builder: (BuildContext context,
                                              List<UserModel> userlist, child) {
                                            for (var element in userlist) {
                                              name = element.name;
                                            }
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Text(
                                                name ??= "User",
                                                style: const TextStyle(
                                                  color: secColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            );
                                          },
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
                                      spreadRadius: 1)
                                ],
                                color: plain,
                                borderRadius: BorderRadius.circular(15)),
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
                                      Text(
                                        'Total Balance',
                                        style: TextStyle(
                                            color: prColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        '₹ ${totaler()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: totaler() < 0
                                                ? expensecol
                                                : incomecol),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: const [
                                              CircleAvatar(
                                                radius: 13,
                                                backgroundColor: plain,
                                                child: Icon(
                                                  Icons.arrow_downward,
                                                  color: prColor,
                                                  size: 19,
                                                ),
                                              ),
                                              Text(
                                                'Income',
                                                style: TextStyle(
                                                    color: prColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: const [
                                              CircleAvatar(
                                                radius: 13,
                                                backgroundColor: plain,
                                                child: Icon(
                                                  Icons.arrow_upward,
                                                  color: prColor,
                                                  size: 19,
                                                ),
                                              ),
                                              Text(
                                                'Expenses',
                                                style: TextStyle(
                                                    color: prColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                      horizontal: 17.5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '₹ ${incometotaler()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: incomecol),
                                      ),
                                      Text(
                                        '₹ ${expensetotaler()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: expensecol),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              SliverToBoxAdapter(child: homeSeeall(context)),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return homeList(context, index);
                }, childCount: box.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
