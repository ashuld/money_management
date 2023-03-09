// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:money_management/screens/expense/widgets/addexbackground.dart';

class ScreenAddExpense extends StatefulWidget {
  const ScreenAddExpense({super.key});

  @override
  State<ScreenAddExpense> createState() => _ScreenAddExpenseState();
}

class _ScreenAddExpenseState extends State<ScreenAddExpense> {
  DateTime date = DateTime.now();
  String? selectedItem;
  final TextEditingController expense = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController amount = TextEditingController();
  FocusNode ex =FocusNode();
  FocusNode amount_ =FocusNode();
  FocusNode name = FocusNode();
  List<String> item= [
    'Food',
    'Entertainment',
    'Education',
    'Transportation'
  ];
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
      backgroundColor: Colors.indigo[50],
      body:SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AddExBackground(context),
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
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey
                          )
                        ),
                        child: DropdownButton<String>(
                          value: selectedItem,
                          items: item.map((e) => DropdownMenuItem(
                            value: e,
                            child: Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: Image.asset('assets/icons/icons8-atm-card-96.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 60, 141)
                                    ),
                                  )
                                ],
                              ),
                            ),
                            )).toList(), 
                            selectedItemBuilder: (context) => item
                            .map((e) => Row(
                              children: [
                                SizedBox(
                                  width: 42,
                                  child: Image.asset('assets/icons/icons8-atm-card-96.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(e,
                                style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 60, 141)
                                    ),
                                )
                              ],
                            ))
                            .toList(),
                            hint: const Text('Category',
                            style: TextStyle(
                              color: Colors.grey
                            ),
                            ),
                            dropdownColor: Colors.indigo[50],
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
                        focusNode: name,
                        controller: expense,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15
                          ),
                          labelText: 'Expense',
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.grey
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 51, 60, 141)
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
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.grey
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 51, 60, 141)
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
                          color: Colors.grey
                        )
                      ),
                      width: 300,
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
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.grey
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 51, 60, 141)
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
                          color: const Color.fromARGB(255, 51, 60, 141)
                        ),
                        width: 120,
                        height: 50,
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 191, 198, 236)
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