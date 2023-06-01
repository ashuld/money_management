// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/constants/itemlist.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/widgets/bottomsheet.dart';
import 'package:money_management/widgets/widgets.dart';

class WidgetSearchCard extends StatelessWidget {
  final TransactionModel modelObj;

  const WidgetSearchCard(
      {super.key, required this.modelObj});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: prColor),
        height: 75,
        child: ListTile(
            onTap: () {
              bottomSheet(context, modelObj);
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/icons/${modelObj.category}.png',
                height: 40,
              ),
            ),
            title: secText600(data: modelObj.name, size: 17.0),
            subtitle: customText(
                data:
                    '${mon[modelObj.datetime.month - 1]}-${modelObj.datetime.day}/${modelObj.datetime.year}',
                thickness: th600,
                color: unselected),
            trailing: customText(
                data: '₹ ${modelObj.amount.toString()}',
                size: 20.0,
                thickness: th600,
                color: modelObj.type == 'Income' ? incomecol : expensecol)),
      ),
    );
  }
}
