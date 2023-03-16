import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';

Widget homeList(BuildContext context, index) {
  getallexpense();
  return ValueListenableBuilder(
    valueListenable: expensenotifier,
    builder: (BuildContext context, List<ExpenseModel>expenselist, child) {
      final data = expenselist[index];
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
                        horizontal: 15
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          IconButton(onPressed: 
                          () {
                            Navigator.pop(context);
                          }, 
                          icon: const Icon(Icons.close,
                          color: secColor,
                          ) 
                          ),
                          Row(
                            children: const [
                              Icon(Icons.edit,
                          color: Colors.blueAccent,),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.delete,
                          color: expensecol,)
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        children: [
                          const Text('Category      :  ',
                          style: TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                          Text(data.category!,
                          style: const TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        children: [
                          const Text('Expense       :  ',
                          style: TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                          Text(data.expense,
                          style: const TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        children: [
                         const Text('Amount       :  ',
                          style: TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                          Text(data.amount.toString(),
                          style: const TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        children: [
                          const Text('Date           :  ',
                          style: TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                          Text(
                            '${data.datetime.hour}:${data.datetime.minute}:${data.datetime.second} ${data.datetime.day}-${data.datetime.month}-${data.datetime.year}',
                            //data.datetime.toString(),
                          style: const TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Row(
                        children: [
                          const Text('Note           :  ',
                          style: TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
                          ),
                          Text(data.note!,
                          style: const TextStyle(
                            color: secColor,
                            fontSize: 15
                          ),
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
        data.expense,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${data.datetime.day}/${data.datetime.month}/${data.datetime.day}',
        //data.datetime.toString(),
        //data.datetime.toString(),
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        data.amount.toString(),
        //data.amount.toString(),
        style:  const TextStyle(
            color:// data.type! ? incomecol : 
            expensecol,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    );
    },
  );
}
