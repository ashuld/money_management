import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/transactions/widgets/allhead.dart';

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: prColor,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'All',
                            style: TextStyle(
                                color: prColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Transactions History',
                      style: TextStyle(
                          color: prColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
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
                            color: Color.fromARGB(255, 51, 60, 141),
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
        ),
      ),
    );
  }
}
