// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/addtransaction/widgets/addtrbackground.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/widgets.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedType;
  final TextEditingController transaction = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController amount = TextEditingController();

  FocusNode ex = FocusNode();
  FocusNode amount_ = FocusNode();
  FocusNode name = FocusNode();

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    name.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secColor,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              addTransactionBackground(context),
              Positioned(
                top: MediaQuery.of(context).size.height * .1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: plain),
                  height: MediaQuery.of(context).size.height * .78,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      box30(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: unselected)),
                          child: DropdownButton(
                            value: selectedType,
                            items: type
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Row(children: [
                                        SizedBox(
                                            width: 40,
                                            child: Image.asset(
                                                'assets/icons/$e.png')),
                                        customBox(width: 10.0),
                                        prText400(data: e, size: 18.0)
                                      ]),
                                    ))
                                .toList(),
                            selectedItemBuilder: (context) => type
                                .map((e) => Row(
                                      children: [
                                        SizedBox(
                                          width: 42,
                                          child: Image.asset(
                                              'assets/icons/$e.png'),
                                        ),
                                        customBox(width: 5.0),
                                        prText400(data: e, size: 18.0)
                                      ],
                                    ))
                                .toList(),
                            hint: customText(data: 'Type', color: unselected),
                            dropdownColor: secColor,
                            isExpanded: true,
                            underline: Container(),
                            onChanged: (value) {
                              setState(() {
                                selectedType = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      box20(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: unselected)),
                          child: DropdownButton(
                              value: selectedItem,
                              items: categoryitem
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 40,
                                                child: Image.asset(
                                                    'assets/icons/$e.png')),
                                            customBox(width: 10.0),
                                            prText400(data: e, size: 18.0)
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              selectedItemBuilder: (context) => categoryitem
                                  .map((e) => Row(
                                        children: [
                                          SizedBox(
                                            width: 42,
                                            child: Image.asset(
                                                'assets/icons/$e.png'),
                                          ),
                                          customBox(width: 5.0),
                                          prText400(data: e, size: 18.0)
                                        ],
                                      ))
                                  .toList(),
                              hint: customText(
                                  data: 'Category', color: unselected),
                              dropdownColor: secColor,
                              isExpanded: true,
                              underline: Container(),
                              onChanged: (value) {
                                setState(() {
                                  selectedItem = value!;
                                });
                              }),
                        ),
                      ),
                      customBox(height: 20.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            focusNode: name,
                            controller: transaction,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                labelText: 'Name',
                                labelStyle: const TextStyle(
                                  fontSize: 17,
                                  color: unselected,
                                ),
                                enabledBorder: unselectedBorder(),
                                focusedBorder: selectedBorder()),
                          )),
                      customBox(height: 20.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            focusNode: amount_,
                            controller: amount,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                labelText: 'Amount',
                                labelStyle: const TextStyle(
                                    fontSize: 17, color: unselected),
                                enabledBorder: unselectedBorder(),
                                focusedBorder: selectedBorder()),
                          )),
                      box20(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: unselected)),
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextButton(
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2016),
                                    lastDate: DateTime(2100));
                                if (newDate == Null) return;
                                setState(() {
                                  date = newDate!;
                                });
                              },
                              child: customText(
                                  data:
                                      'Date : ${date.day}/ ${date.month}/ ${date.year}',
                                  size: 15.0,
                                  thickness: FontWeight.bold,
                                  color: prColor)),
                        ),
                      ),
                      box20(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            focusNode: ex,
                            controller: note,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                labelText: 'Note',
                                labelStyle: const TextStyle(
                                  fontSize: 17,
                                  color: unselected,
                                ),
                                enabledBorder: unselectedBorder(),
                                focusedBorder: selectedBorder()),
                          )),
                      box20(),
                      GestureDetector(
                        onTap: () {
                          onbuttonclick();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: prColor),
                            width: MediaQuery.of(context).size.width * .23,
                            height: MediaQuery.of(context).size.height * .06,
                            child: secText500(data: 'Save', size: 20.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> onbuttonclick() async {
    final nam = transaction.text.trim();
    final amo = amount.text;
    final no = note.text;
    if (double.parse(amo)<= 0||
      amo.isEmpty ||
        amo.contains('-') ||
        amo.contains('.') ||
        amo.contains(',')) {
      showSnackBarr(context, "Invalid Amount");
    } else if (nam.isEmpty ||
        no.isEmpty ||
        selectedItem == null ||
        selectedType == null) {
      showSnackBarr(context, "Items are Required");
    } else {
      showToast(message: 'Transaction Added');
      final amount1 = double.parse(amo);
      final trans = TransactionModel(
          type: selectedType!,
          category: selectedItem!,
          name: nam,
          amount: amount1,
          datetime: date,
          note: no,
          id: DateTime.now().microsecondsSinceEpoch.toString());
      addtransaction(trans);
      refreshTransaction();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavigation()));
    }
  }
}
