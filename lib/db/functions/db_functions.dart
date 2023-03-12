import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/db/model/data.dart';

ValueNotifier<List<addExpense>> expensenotifier = ValueNotifier([]);
ValueNotifier<List<addIncome>> incomenotifier = ValueNotifier([]);
ValueNotifier<List<user>> usernotifier = ValueNotifier([]);

 String? userName;

name()async{
    userName = await openuser();

}


//expense functions
final expensedb = 'expense';
Future<void> addexpense(addExpense value) async {
  final expenseData = await Hive.openBox<addExpense>(expensedb);
  final id = await expenseData.add(value);
  value.id = id;
  expensenotifier.value.add(value);
  expensenotifier.notifyListeners();
}
Future<void> getallexpense() async {
  final expenseData = await Hive.openBox<addExpense>(expensedb);
  expensenotifier.value.clear();
  expensenotifier.value.addAll(expenseData.values);
  expensenotifier.notifyListeners();
}

//incomefunctions
final incomedb = 'income';
Future<void> addincome(addIncome value) async {
  final incomeData = await Hive.openBox<addIncome>(incomedb);
  final id = await incomeData.add(value);
  value.id = id;
  incomenotifier.value.add(value);
  incomenotifier.notifyListeners();
}
Future<void> getallincome() async {
  final incomeData = await Hive.openBox<addIncome>(incomedb);
  incomenotifier.value.clear();
  incomenotifier.value.addAll(incomeData.values);
  incomenotifier.notifyListeners();
}



//userfunctions
final userdb = 'user';
Future<void> adduser(user value) async {
  final userData = await Hive.openBox<user>(userdb);
  final id = await userData.add(value);
  value.id = id;
  usernotifier.value.add(value);
  usernotifier.notifyListeners();
}
Future<void> getalluser() async {
  final userData = await Hive.openBox<user>(userdb);
  usernotifier.value.clear();
  usernotifier.value.addAll(userData.values);
  usernotifier.notifyListeners();
}

Future<String> openuser() async{
final userData = await Hive.openBox<user>(userdb);
final name = userData.name;
if(name==null){
  return "user";
}
else{
return name;
}

}

Future<void> notify() async{
  getallexpense();
  getallincome();
  getalluser();
}