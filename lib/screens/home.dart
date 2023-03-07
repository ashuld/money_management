import 'package:flutter/material.dart';
import 'package:money_management/db/functions/colourfunctions/color.dart';
import 'package:money_management/db/model/listdata.dart';
import 'package:money_management/screens/all.dart';
import 'package:money_management/widgets/drawer.dart';
import 'package:money_management/widgets/homehead.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
 //static final GlobalKey<ScaffoldState> key_ = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key_,
        endDrawer: profileDrawer(context),
        backgroundColor: secColor,
        body:  SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 330,
                  child: head(context)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text('Transactions History',
                      style: TextStyle(
                        color:  prColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const ScreenTransactions(),)
                            );
                        },
                        child: const Text('See All',
                        style: TextStyle(
                          color:  Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
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