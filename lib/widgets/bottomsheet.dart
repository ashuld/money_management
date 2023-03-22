import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/widgets/widgets.dart';

PersistentBottomSheetController bottomSheet(context, data) {
  return showBottomSheet(
    backgroundColor: prColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            box10(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: secIcon(icon: Icons.close)),
                  Row(
                    children: [
                      customIcon(icon: Icons.edit, color: Colors.blueAccent),
                      customBox(width: 10.0),
                      customIcon(icon: Icons.delete, color: expensecol),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    secText400(data: 'Category      :  '),
                    secText400(data: data.category)
                  ],
                )),
            box15(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    secText400(data: 'Name           :  '),
                    secText400(data: data.name)
                  ],
                )),
            box15(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    secText400(data: 'Amount       :  '),
                    customText(
                        data: '₹  ${data.amount.toString()}',
                        color: data.type == 'Income' ? incomecol : expensecol,
                        size: 15.0)
                  ],
                )),
            box15(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    secText400(data: 'Date           :  '),
                    secText400(
                        data:
                            '${data.datetime.hour}:${data.datetime.minute}:${data.datetime.second} ${data.datetime.day}-${data.datetime.month}-${data.datetime.year}')
                  ],
                )),
            box15(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    secText400(data: 'Note           :  '),
                    secText400(data: data.note)
                  ],
                ))
          ],
        ),
      );
    },
  );
}
