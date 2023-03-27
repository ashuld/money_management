// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_const_declarations
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';

ValueNotifier<List<TransactionModel>> transactionnotifier = ValueNotifier([]);
ValueNotifier<List<UserModel>> usernotifier = ValueNotifier([]);
ValueNotifier<List<TransactionModel>> transactionfilternotifier =
    ValueNotifier([]);
ValueNotifier<List<TransactionModel>> chartlistnotifier = ValueNotifier([]);

//transaction functions
final transactiondb = 'expense';
Future<void> addtransaction(TransactionModel value) async {
  final transactionData = await Hive.openBox<TransactionModel>(transactiondb);
  await transactionData.put(value.id, value);
  refreshTransaction();
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

Future<void> deleteTransaction(String transId) async {
  final transactionData = await Hive.openBox<TransactionModel>(transactiondb);
  await transactionData.delete(transId);
  await refreshTransaction();
  refreshTransaction();
}

Future<void> editTransaction(TransactionModel obj) async {
  final transactionDB = await Hive.openBox<TransactionModel>(transactiondb);
  transactionDB.put(obj.id, obj);
  refreshTransaction();
  notify();
}

//userfunctions
final userdb = 'User';
Future<void> adduser(UserModel value) async {
  final transactionData = await Hive.openBox<UserModel>(userdb);
  await transactionData.put(value.id, value);
  getalluser();
}

Future<void> getalluser() async {
  final userData = await Hive.openBox<UserModel>(userdb);
  usernotifier.value.clear();
  usernotifier.value.addAll(userData.values);
  usernotifier.notifyListeners();
}

Future<void> edituser(UserModel value) async {
  final transactionDB = await Hive.openBox<UserModel>(userdb);
  transactionDB.put(value.id, value);
  getalluser();
  notify();
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
