import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/statistics/widgets/reportcontents.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int indexColor = 0;
  Map<String, double> dataMap = {
    "Entertainment": 60,
    "Food": 36,
    "Outing": 4,
  };
  @override
  Widget build(BuildContext context) {
    notify();
    final box = Hive.box<TransactionModel>(transactiondb);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[50],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  box20(),
                  prText600(data: 'Statistics', size: 20.0),
                  box20(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexColor = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      indexColor == index ? prColor : secColor),
                              child: Center(
                                child: Text(
                                  day[index],
                                  style: TextStyle(
                                      color: indexColor == index
                                          ? plain
                                          : unselected,
                                      fontSize: 20,
                                      fontWeight: th500),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
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
                          subtitle: Text(
                            '$mon-${reportdata.datetime.day}/${reportdata.datetime.year}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: Text(
                            reportdata.amount.toString(),
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
