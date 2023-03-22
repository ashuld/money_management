// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_const_declarations
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';

ValueNotifier<List<TransactionModel>> transactionnotifier = ValueNotifier([]);
ValueNotifier<List<UserModel>> usernotifier = ValueNotifier([]);
ValueNotifier<List<TransactionModel>> transactionfilternotifier = ValueNotifier([]);

//transaction functions
final transactiondb = 'expense';
Future<void> addtransaction(TransactionModel value) async {
  final transactionData = await Hive.openBox<TransactionModel>(transactiondb);
  final id = await transactionData.add(value);
  value.id = id;
  transactionnotifier.value.add(value);
  transactionnotifier.notifyListeners();
}

Future<List<TransactionModel>> getalltransaction() async {
  final transactionData = await Hive.openBox<TransactionModel>(transactiondb);
  return transactionData.values.toList();
}

Future<void> refreshTransaction() async {
  final translist = await getalltransaction();
  translist.sort((first, second) => second.datetime.compareTo(first.datetime));
  transactionnotifier.value.clear();
  transactionnotifier.value.addAll(translist);
  transactionnotifier.notifyListeners();
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

//data reset
Future<void> reset() async {
  final resetbox = Hive.box<TransactionModel>(transactiondb);
  resetbox.clear();
  refreshTransaction();
}

//reading database values
Future<void> notify() async {
  await refreshTransaction();
  await getalluser();
}
