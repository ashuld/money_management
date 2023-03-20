import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/model/transactions.dart';

class WidgetSearchCard extends StatelessWidget {
  final TransactionModel modelObj;
  final Icon icon;
  const WidgetSearchCard({
    super.key,
    required this.modelObj
    ,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: prColor
        ),
        height: 75,
        child:  Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListTile(
            onTap: () {
              
            },
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 15
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    modelObj.category,
                    style: const TextStyle(
                      color: secColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   const SizedBox(
                     height: 3,
                   ),
                  Text(modelObj.note,
                  style: const TextStyle(
                    color: secColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text('${modelObj.amount}',
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: modelObj.type == 'Income'? incomecol:expensecol
              ),
              ),
              ),
          ),
          ),
      ),
    );
  }
}