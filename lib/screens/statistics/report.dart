import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/statistics/widgets/reportcontents.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  @override
  Widget build(BuildContext context) {
    notify();
    final box = Hive.box<TransactionModel>(transactiondb);
    return SafeArea(
      child: Scaffold(
        backgroundColor: secColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  box20(),
                  prText600(data: 'Statistics', size: 20.0),
                  box20(),
                  customBox(height: 30.0),
                  pieChart(context, dataMap),
                  box20(),
                  spending()
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ValueListenableBuilder(
                    valueListenable: transactionnotifier,
                    builder: (BuildContext context,
                        List<TransactionModel> transactionlist, Widget? child) {
                      final reportdata = transactionlist[index];
                      return ListTile(
                          onTap: () {
                            bottomSheet(context, reportdata);
                          },
                          leading: Image.asset(
                            'assets/icons/${reportdata.category}.png',
                            height: 40,
                          ),
                          title: prText600(data: reportdata.name, size: 17.0),
                          subtitle: Text(
                            '${mon[reportdata.datetime.month - 1]}-${reportdata.datetime.day}/${reportdata.datetime.year}',
                            style: const TextStyle(
                                color: unselected, fontWeight: FontWeight.w600),
                          ),
                          trailing: Text(
                            '₹ ${reportdata.amount.toString()}',
                            style: TextStyle(
                                color: reportdata.type == 'Income'
                                    ? incomecol
                                    : expensecol,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ));
                    });
              }, childCount: box.length),
            )
          ],
        ),
      ),
    );
  }
}
