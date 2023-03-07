import 'package:flutter/material.dart';
import 'package:money_management/db/functions/colourfunctions/color.dart';
import 'package:money_management/db/model/listdata.dart';
import 'package:money_management/widgets/allhead.dart';

class ScreenTransactions extends StatefulWidget {
  const ScreenTransactions({super.key});

  @override
  State<ScreenTransactions> createState() => _ScreenTransactionsState();
}

class _ScreenTransactionsState extends State<ScreenTransactions> {
  List day =['Day','Week','Month','Year'];
  int indexColor = 0 ;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      body:  SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: transactionHead(context)),
            ),
            SliverToBoxAdapter(
              child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: prColor,
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'All',
                                style: TextStyle(
                                  color: prColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: prColor,
                                  ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                     Text('Transactions History',
                    style: TextStyle(
                      color:  prColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                    ),
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
    );
  }
}