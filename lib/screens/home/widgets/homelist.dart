import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';

Widget homeList(BuildContext context, index) {
  refreshTransaction();
  dynamic mon;
  return ValueListenableBuilder(
    valueListenable: transactionnotifier,
    builder:
        (BuildContext context, List<TransactionModel> transactionlist, child) {
      if (transactionlist.isEmpty) {
        return Container();
      }
      final data = transactionlist[index];
      switch (data.datetime.month.toString()) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Category      :  ',
                            style: TextStyle(color: secColor, fontSize: 15),
                          ),
                          Text(
                            data.category,
                            style:
                                const TextStyle(color: secColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Expense       :  ',
                            style: TextStyle(color: secColor, fontSize: 15),
                          ),
                          Text(
                            data.name,
                            style:
                                const TextStyle(color: secColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Amount       :  ',
                            style: TextStyle(color: secColor, fontSize: 15),
                          ),
                          Text(
                            '₹  ${data.amount.toString()}',
                            style: TextStyle(
                                color: data.type == 'Income'
                                    ? incomecol
                                    : expensecol,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Date           :  ',
                            style: TextStyle(color: secColor, fontSize: 15),
                          ),
                          Text(
                            '${data.datetime.hour}:${data.datetime.minute}:${data.datetime.second} ${data.datetime.day}-${data.datetime.month}-${data.datetime.year}',
                            //data.datetime.toString(),
                            style:
                                const TextStyle(color: secColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Note           :  ',
                            style: TextStyle(color: secColor, fontSize: 15),
                          ),
                          Text(
                            data.note,
                            style:
                                const TextStyle(color: secColor, fontSize: 15),
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
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/icons/${data.category}.png',
            height: 40,
          ),
        ),
        title: Text(
          data.name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '$mon-${data.datetime.day}/${data.datetime.year}',
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          '₹ ${data.amount.toString()}',
          //data.amount.toString(),
          style: TextStyle(
              color: data.type == 'Income' ? incomecol : expensecol,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      );
    },
  );
}
