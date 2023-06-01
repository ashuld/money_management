import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';

Widget homeList(BuildContext context, index) {
  refreshTransaction();
  // dynamic mon;
  return ValueListenableBuilder(
    valueListenable: transactionnotifier,
    builder:
        (BuildContext context, List<TransactionModel> transactionlist, child) {
          notify();
      if (transactionlist.isEmpty || index >= transactionlist.length) {
        return Container();
      }
      final data = transactionlist[index];
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
            data:
                '${mon[data.datetime.month - 1]}-${data.datetime.day}/${data.datetime.year}',
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
