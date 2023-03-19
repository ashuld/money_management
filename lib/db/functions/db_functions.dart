
// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';

ValueNotifier<List<TransactionModel>> transactionnotifier = ValueNotifier([]);
ValueNotifier<List<UserModel>> usernotifier = ValueNotifier([]);

//expense functions
final transactiondb = 'expense';
Future<void> addtransaction(TransactionModel value) async {
  final transactionData = await Hive.openBox<TransactionModel>(transactiondb);
  final id = await transactionData.add(value);
  value.id = id;
  transactionnotifier.value.add(value);
  transactionnotifier.notifyListeners();
}

Future<void> getalltransaction() async {
  final expenseData = await Hive.openBox<TransactionModel>(transactiondb);
  transactionnotifier.value.clear();
  transactionnotifier.value.addAll(expenseData.values);
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

Future<void> reset() async {
  final resetbox = Hive.box<TransactionModel>(transactiondb);
  resetbox.clear();
  getalltransaction();
}

Future<void> notify() async {
  await getalltransaction();
  await getalluser();
}
