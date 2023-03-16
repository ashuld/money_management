import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';

ValueNotifier<List<ExpenseModel>> expensenotifier = ValueNotifier([]);
ValueNotifier<List<IncomeModel>> incomenotifier = ValueNotifier([]);
ValueNotifier<List<UserModel>> usernotifier = ValueNotifier([]);




//expense functions
final expensedb = 'expense';
Future<void> addexpense(ExpenseModel value) async {
  final expenseData = await Hive.openBox<ExpenseModel>(expensedb);
  final id = await expenseData.add(value);
  value.id = id;
  expensenotifier.value.add(value);
  expensenotifier.notifyListeners();
}
Future<void> getallexpense() async {
  final expenseData = await Hive.openBox<ExpenseModel>(expensedb);
  expensenotifier.value.clear();
  expensenotifier.value.addAll(expenseData.values);
  expensenotifier.notifyListeners();
}

//incomefunctions
final incomedb = 'income';
Future<void> addincome(IncomeModel value) async {
  final incomeData = await Hive.openBox<IncomeModel>(incomedb);
  final id = await incomeData.add(value);
  value.id = id;
  incomenotifier.value.add(value);
  incomenotifier.notifyListeners();
}
Future<void> getallincome() async {
  final incomeData = await Hive.openBox<IncomeModel>(incomedb);
  incomenotifier.value.clear();
  incomenotifier.value.addAll(incomeData.values);
  incomenotifier.notifyListeners();
}



//userfunctions
final userdb = 'User';
Future<void> adduser(UserModel value) async {
  final userData = await Hive.openBox<UserModel>(userdb);
  final id = await userData.add(value);
  value.id = id;
  usernotifier.value.add(value);
  usernotifier.notifyListeners();
}
Future<void> getalluser() async {
  final userData = await Hive.openBox<UserModel>(userdb);
  usernotifier.value.clear();
  usernotifier.value.addAll(userData.values);
  usernotifier.notifyListeners();
}





Future<void> notify() async{
 await getallexpense();
 await getallincome();
  await getalluser();
}