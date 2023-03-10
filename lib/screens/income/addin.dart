import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/income/widgets/addinbackground.dart';

class ScreenAddIncome extends StatefulWidget {
  const ScreenAddIncome({super.key});

  @override
  State<ScreenAddIncome> createState() => _ScreenAddIncomeState();
}

class _ScreenAddIncomeState extends State<ScreenAddIncome> {
  DateTime date = DateTime.now();
  String? selectedItem;
  final TextEditingController income = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController amount = TextEditingController();
  FocusNode inc =FocusNode();
  FocusNode amount_ =FocusNode();
  FocusNode ex = FocusNode();
  List<String> item= [
    'Salary',
    'Other Income',
  ];
  @override
  void initState() {
    super.initState();
    inc.addListener(() {
      setState(() {});
     });
     ex.addListener(() {
      setState(() {});
     });
     amount_.addListener(() {
      setState(() {});
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body:SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AddInBackground(context),
            Positioned(
              top: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
                ),
                height: 550,
                width: 340,
                child: Column(
                  children:  [
                     const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        width: 310,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: unselected
                          )
                        ),
                        child: DropdownButton<String>(
                          value: selectedItem,
                          items: incomeitem.map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Image.asset('assets/icons/icons8-transaction-96.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: prColor
                                  ),
                                )
                              ],
                            ),
                            )).toList(), 
                            selectedItemBuilder: (context) => incomeitem
                            .map((e) => Row(
                              children: [
                                SizedBox(
                                  width: 42,
                                  child: Image.asset('assets/icons/icons8-transaction-96.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(e,
                                style: const TextStyle(
                                      fontSize: 18,
                                      color: prColor
                                    ),
                                )
                              ],
                            ))
                            .toList(),
                            hint: const Text('Category',
                            style: TextStyle(
                              color: unselected
                            ),
                            ),
                            dropdownColor: secColor,
                            isExpanded: true,
                            underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              selectedItem = value!;
                            });
                          },),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: TextField(
                        focusNode: inc,
                        controller: income,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15
                          ),
                          labelText: 'Income',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: unselected,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: unselected
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: prColor
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        focusNode: amount_,
                        controller: amount,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15
                          ),
                          labelText: 'Amount',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: unselected,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: unselected
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: prColor
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: unselected
                        )
                      ),
                      width: 310,
                      child: TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context, 
                            initialDate: date, 
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
                            color: Colors.black
                          ),
                          )
                        ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15
                      ),
                      child: TextField(
                        focusNode: ex,
                        controller: note,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15
                          ),
                          labelText: 'Note',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: unselected,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: unselected
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: prColor
                            )
                          )
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: prColor
                        ),
                        width: 120,
                        height: 50,
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: secColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ))
    );
  }
}