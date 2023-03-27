import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';

double total = 0;
final box = Hive.box<TransactionModel>(transactiondb);

double totaler() {
  refreshTransaction();
  var totals = box.values.toList();
  List a = [0.0];
  for (var i = 0; i < totals.length; i++) {
    a.add(
        totals[i].type == 'Income' ? totals[i].amount : totals[i].amount * -1);
  }
  total = a.reduce((value, element) => value + element);
  return total;
}

double incometotaler() {
  refreshTransaction();
  var totals = box.values.toList();
  List a = [0.0];
  for (var i = 0; i < totals.length; i++) {
    a.add(totals[i].type == 'Income' ? totals[i].amount : 0);
  }
  total = a.reduce((value, element) => value + element);
  return total;
}

double expensetotaler() {
  refreshTransaction();
  var totals = box.values.toList();
  List a = [0.0];
  for (var i = 0; i < totals.length; i++) {
    a.add(totals[i].type == 'Income' ? 0 : totals[i].amount * -1);
  }
  total = a.reduce((value, element) => value + element);
  return total;
}
