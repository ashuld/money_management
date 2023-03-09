import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/category/addcategory.dart';
import 'package:money_management/screens/expense/addex.dart';
import 'package:money_management/screens/income/addin.dart';

Widget bottomSheet(BuildContext context) {
  return SizedBox(
    height: 250,
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.close,
                  size: 35,
                  color: secColor,
                ),
              ),
            ],
          ),
        ),
        Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secColor
                    )
                  ),
                ),
             TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ScreenAddCategory()
                    ),
                    );
              }, 
              child: const Text(
                'Add Category',
                style: TextStyle(
                  color: secColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secColor
                    )
                  ),
                ),
             TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ScreenAddExpense()
                    ),
                    );
              }, 
              child: const Text(
                'Add Expense',
                style: TextStyle(
                  color: secColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secColor
                    )
                  ),
                ),
                TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ScreenAddIncome()
                    ),
                    );
              }, 
              child: const Text(
                'Add Income',
                style: TextStyle(
                  color: secColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secColor
                    )
                  ),
                ),
      ],
    ),
  );
}
