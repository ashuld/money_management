import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/screens/edittransaction/widgets/edittrbg.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/widgets.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({super.key, required this.transactionlist});
  final TransactionModel transactionlist;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedType;
  TextEditingController transaction = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  void initState() {
    super.initState();
    transaction = TextEditingController(text: widget.transactionlist.name);
    note = TextEditingController(text: widget.transactionlist.note);
    amount = TextEditingController(text: widget.transactionlist.amount.toString());
    date = widget.transactionlist.datetime;
    selectedItem = widget.transactionlist.category;
    selectedType = widget.transactionlist.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secColor,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              editTransactionBackground(context),
              Positioned(
                top: MediaQuery.of(context).size.height * .15,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: plain),
                  height: MediaQuery.of(context).size.height * .68,
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
                                if (newDate == null) return;
                                setState(() {
                                  date = newDate;
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
                            child: secText500(data: 'Update', size: 20.0)),
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
    final amo = double.parse(amount.text);
    final no = note.text;
    if (amo.toString().isEmpty ||
        amo.toString().contains('-') ||
        amo.toString().contains('.') ||
        amo.toString().contains(',') ||
        amo.toString().contains(' ')) {
      showSnackBarr(context, "Invalid Amount");
    }
   else if (nam.isEmpty ||
        no.isEmpty ||
        selectedItem == null ||
        selectedType == null) {
      showSnackBarr(context,"Items are required");
    } else {
      showToast(message: 'Transaction Updated');
      final editedtransaction = TransactionModel(
          type: selectedType!,
          category: selectedItem!,
          name: nam,
          amount: amo,
          datetime: date,
          note: no,
          id: widget.transactionlist.id);
      editTransaction(editedtransaction);
      refreshTransaction();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavigation()));
    }
  }
}
