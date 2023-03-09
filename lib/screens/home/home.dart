import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/db/model/listdata.dart';
import 'package:money_management/screens/home/widgets/home_seeall.dart';
import 'package:money_management/screens/home/widgets/homelist.dart';
import 'package:money_management/screens/login/login.dart';
import 'package:money_management/screens/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> key_ = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key_,
        endDrawer: Drawer(
            elevation: 10.0,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: prColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secColor,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(
                        height: 10
                        ),
                      Text('5544545454511',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secColor,
                            fontSize: 14.0
                        ),
                      ),
                      SizedBox(
                        height: 10
                        ),
                      Text('email@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: secColor,
                            fontSize: 14.0
                        ),
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
                style: TextStyle(
                  color: prColor,
                  fontSize: 18
                  ),
                  ),
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLogged', false);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
                // ignore: use_build_context_synchronously
                Navigator
                .push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ScreenLogIn(),
                    )
                  );
              },
            ),
            const Divider(
              height: 3.0
              ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: prColor,
                ),
              title: const Text(
                'Settings', 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: prColor,
                  fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder:(context) => const ScreenSettings(), 
                    ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.close,
                color: prColor,
                ),
              title: const Text(
                'Close Drawer', 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: prColor,
                  fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
  ),
        backgroundColor: secColor,
        body:  SafeArea(
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
                      bottomRight: Radius.circular(40)
                    )
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  const Text('Welcome',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: secColor,
                                  ),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      key_.currentState!.openEndDrawer();
                                    }, 
                                    icon: const Icon(Icons.menu,
                                    color: secColor,
                                    ),
                                    )
                                ],
                              ),
                            ),
                            const Padding(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 15
                              ),
                              child: Text('User',
                              style: TextStyle(
                                color: secColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              ),
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
                      spreadRadius: 1
                    )
                  ],
                  color: plain,
                  borderRadius: BorderRadius.circular(15)
                ),
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
                           Text('Total Balance',
                          style: TextStyle(
                            color: prColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15
                      ),
                      child: Row(
                        children: const [
                           Text(
                            '₹ 3000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: incomecol
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Row(
                            children:  [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:  plain,
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color:  prColor,
                                      size: 19,),
                                  ),
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                    color: prColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                    ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children:  [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor:  plain,
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color:  prColor,
                                      size: 19,),
                                  ),
                                  Text(
                                    'Expenses',
                                    style: TextStyle(
                                    color: prColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                    ),
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
                        horizontal: 30
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '₹ 3500',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: incomecol
                            ),
                            ),
                            Text(
                            '₹ 500',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: expensecol
                            ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
                  ),
              ),
              SliverToBoxAdapter(
                child: homeSeeall(context)
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return homeList(index);
                  },
                  childCount: geter().length
                  ),
                  )
            ],
          ),
          ),
      ),
    );
  }
}
