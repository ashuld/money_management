import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/transactions/widgets/allhead.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';

class ScreenTransactions extends StatefulWidget {
  const ScreenTransactions({super.key});

  @override
  State<ScreenTransactions> createState() => _ScreenTransactionsState();
}

class _ScreenTransactionsState extends State<ScreenTransactions> {
  @override
  Widget build(BuildContext context) {
    notify();
    final box = Hive.box<TransactionModel>(transactiondb);
    return Scaffold(
      backgroundColor: secColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  child: transactionHead(context)),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    prText600(data: 'Transactions History', size: 17.0),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ValueListenableBuilder(
                    valueListenable: transactionnotifier,
                    builder: (BuildContext context,
                        List<TransactionModel> transactionlist, Widget? child) {
                      final reportdata = transactionlist[index];
                      String mon;
                      switch (reportdata.datetime.month.toString()) {
                        case '1':
                          mon = 'Jan';
                          break;
                        case '2':
                          mon = 'Feb';
                          break;
                        case '3':
                          mon = "Mar";
                          break;
                        case '4':
                          mon = 'Apr';
                          break;
                        case '5':
                          mon = 'May';
                          break;
                        case '6':
                          mon = 'Jun';
                          break;
                        case '7':
                          mon = 'Jul';
                          break;
                        case '8':
                          mon = 'Aug';
                          break;
                        case '9':
                          mon = 'Sep';
                          break;
                        case '10':
                          mon = 'Oct';
                          break;
                        case '11':
                          mon = 'Nov';
                          break;
                        case '12':
                          mon = 'Dec';
                          break;
                        default:
                          return const Text('data');
                      }
                      return ListTile(
                        onTap: () {
                          bottomSheet(context, reportdata);
                        },
                        leading: Image.asset(
                          'assets/icons/${reportdata.category}.png',
                          height: 40,
                        ),
                        title: prText600(data: reportdata.name, size: 17.0),
                        subtitle: customText(
                            color: unselected,
                            data:
                                '$mon-${reportdata.datetime.day}/${reportdata.datetime.year}',
                            thickness: th600),
                        trailing: Text(
                          reportdata.amount.toString(),
                          style: TextStyle(
                              color: reportdata.type == 'Income'
                                  ? incomecol
                                  : expensecol,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    });
              }, childCount: box.length),
            )
          ],
        ),
      ),
    );
  }
}
