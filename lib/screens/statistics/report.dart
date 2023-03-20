import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  List day = ['Day','Week', 'Month', 'Year'];
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
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Statistics',
                  style: TextStyle(
                      color: Color.fromARGB(255, 51, 60, 141),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                                color: indexColor == index
                                    ? prColor
                                    : secColor),
                            child: Center(
                              child: Text(
                                day[index],
                                style: TextStyle(
                                    color: indexColor == index
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 51, 60, 141),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Expenses',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 51, 60, 141),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Color.fromARGB(255, 51, 60, 141),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      PieChart(
                        dataMap: dataMap,
                        chartRadius: MediaQuery.of(context).size.width,
                        legendOptions: const LegendOptions(
                            legendTextStyle: TextStyle(
                                color: Color.fromARGB(255, 51, 60, 141),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            legendPosition: LegendPosition.right),
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Top Spendings',
                        style: TextStyle(
                            color: prColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.swap_vert,
                        size: 25,
                        color: prColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ValueListenableBuilder(
                valueListenable: transactionnotifier,
                builder: (BuildContext context, List<TransactionModel> transactionlist,
                    Widget? child) {
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
                      showBottomSheet(
                        backgroundColor: prColor,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 260,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: secColor,
                                          )),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.blueAccent,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.delete,
                                            color: expensecol,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Category      :  ',
                                        style: TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                      Text(
                                        reportdata.category,
                                        style: const TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Expense       :  ',
                                        style: TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                      Text(
                                        reportdata.name,
                                        style: const TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Amount       :  ',
                                        style: TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                      Text(
                                        reportdata.amount.toString(),
                                        style: const TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Date           :  ',
                                        style: TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                      Text(
                                        '${reportdata.datetime.hour}:${reportdata.datetime.minute}:${reportdata.datetime.second} ${reportdata.datetime.day}-${reportdata.datetime.month}-${reportdata.datetime.year}',
                                        //data.datetime.toString(),
                                        style: const TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Note           :  ',
                                        style: TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                      Text(
                                        reportdata.note,
                                        style: const TextStyle(
                                            color: secColor, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    leading: Image.asset(
                      'assets/icons/${reportdata.category}.png',
                      height: 40,
                    ),
                    title: Text(
                      reportdata.name,
                      style: const TextStyle(
                          color: prColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '$mon-${reportdata.datetime.day}/${reportdata.datetime.year}',
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      reportdata.amount.toString(),
                      style:  TextStyle(
                          color: reportdata.type == 'Income'?incomecol:expensecol,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              );
            }, childCount: box.length),
          )
        ],
      )),
    );
  }
}
