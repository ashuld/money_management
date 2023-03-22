import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';

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
          bottomSheet(context, data);
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/icons/${data.category}.png',
            height: 40,
          ),
        ),
        title: prText600(data: data.name, size: 17.0),
        subtitle: customText(
            data: '$mon-${data.datetime.day}/${data.datetime.year}',
            thickness: th600,
            color: unselected),
        trailing: customText(
            data: '₹ ${data.amount.toString()}',
            size: 20.0,
            thickness: th600,
            color: data.type == 'Income' ? incomecol : expensecol),
      );
    },
  );
}
