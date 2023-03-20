// ignore_for_file: avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/addtransaction/widgets/addtrbackground.dart';
import 'package:money_management/widgets/bottomnavigation.dart';

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
                top: 120,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: plain),
                  height: 550,
                  width: 340,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: unselected)),
                          child: DropdownButton(
                            value: selectedType,
                            items: type
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 40,
                                                child: Image.asset(
                                                    'assets/icons/$e.png')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              e,
                                              style: const TextStyle(
                                                  fontSize: 18, color: prColor),
                                            )
                                          ],
                                        ),
                                      ),
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
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18, color: prColor),
                                        )
                                      ],
                                    ))
                                .toList(),
                            hint: const Text(
                              'Type',
                              style: TextStyle(color: unselected),
                            ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: 310,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: unselected)),
                          child: DropdownButton(
                            value: selectedItem,
                            items: categoryitem
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 40,
                                                child: Image.asset(
                                                    'assets/icons/$e.png')),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              e,
                                              style: const TextStyle(
                                                  fontSize: 18, color: prColor),
                                            )
                                          ],
                                        ),
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
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18, color: prColor),
                                        )
                                      ],
                                    ))
                                .toList(),
                            hint: const Text(
                              'Category',
                              style: TextStyle(color: unselected),
                            ),
                            dropdownColor: secColor,
                            isExpanded: true,
                            underline: Container(),
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          focusNode: amount_,
                          controller: amount,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Amount',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.grey)),
                        width: 310,
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
                            child: Text(
                              'Date : ${date.day}/ ${date.month}/ ${date.year}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: prColor),
                            )),
                      ),
                      const SizedBox(height: 20),
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          onbuttonclick();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: prColor),
                          width: 120,
                          height: 50,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: secColor),
                          ),
                        ),
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
    final category = selectedItem;
    final type1 = selectedType;
    final nam = transaction.text;
    final amo = double.parse(amount.text);
    final datetim = date;
    final no = note.text;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: prColor,
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 2500),
        content: Text(
          'Transaction added',
          style: TextStyle(fontStyle: FontStyle.italic, color: secColor),
        )));
    final trans = TransactionModel(
      type: type1!, 
      category: category!, 
      name: nam, 
      amount: amo, 
      datetime: datetim, 
      note: no);
    addtransaction(trans);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
  }
}
