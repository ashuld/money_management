// ignore_for_file: camel_case_types
import 'package:hive/hive.dart';
part 'transactions.g.dart';

@HiveType(typeId: 1)
 class ExpenseModel {
  @HiveField(0)
int? id;
  @ HiveField(1)
String? category;  
  @ HiveField(2)
String expense;
  @ HiveField(3)
double amount;
  @ HiveField(4)
DateTime datetime;
  @ HiveField(5)
String? note;
  @HiveField(6)
bool? type =false;
ExpenseModel({
  required this.category,
  required this.amount,
  required this.datetime,
  required this.expense,
  this.note,
  this.type,
  this.id
  });
}





@HiveType(typeId: 2)
class IncomeModel{
  @HiveField(0)
int? id;
  @ HiveField(1)
String category;
  @ HiveField(2)
String income;
  @ HiveField(3)
double amount;
  @ HiveField(4)
DateTime datetime;
  @ HiveField(5)
String? note;
  @HiveField(6)
bool? type =false;
IncomeModel({
  required this.category,
  required this.income,
  required this.amount,
  required this .datetime,
  this.id,
  this.note,
  this.type
});
  
}


