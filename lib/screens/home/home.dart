// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/home/widgets/contenthome.dart';
import 'package:money_management/screens/home/widgets/drawer.dart';
import 'package:money_management/screens/home/widgets/home_seeall.dart';
import 'package:money_management/screens/home/widgets/homelist.dart';
import 'package:money_management/widgets/widgets.dart';

var newname;
var phno;
var email;
var password;

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
    notify();
    final box = Hive.box<TransactionModel>(transactiondb);
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
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
                    newname = UserModel(name: element.name, phn: element.phn, mail: element.mail, password: element.password, id: element.id);
                  }
                  return ListView(
                    children: [
                      header(name, phnno, mail),
                      tile1(context),
                      const Divider(height: 3.0),
                      tile2(context, newname),
                      tile3(context)
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
                      height: MediaQuery.of(context).size.height * .43,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .28,
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
                                          welcome(key_),
                                          ValueListenableBuilder(
                                              valueListenable: usernotifier,
                                              builder: (BuildContext context,
                                                  List<UserModel> userlist,
                                                  child) {
                                                for (var element in userlist) {
                                                  name = element.name;
                                                }
                                                return userName(name);
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * .15,
                            left: MediaQuery.of(context).size.width * .1,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .24,
                              width: MediaQuery.of(context).size.width * .81,
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
                              child: ValueListenableBuilder(
                                valueListenable: transactionnotifier,
                                builder: (context, value, child) {
                                  return Column(
                                    children: [
                                      box20(),
                                      totalText(),
                                      customBox(height: 7.0),
                                      totalBalance(),
                                      box15(),
                                      inexText(),
                                      customBox(height: 6.0),
                                      balance()
                                    ],
                                  );
                                },
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
                  }, childCount: box.length >= 4 ? 4 : box.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
