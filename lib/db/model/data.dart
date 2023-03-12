// ignore_for_file: camel_case_types
import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 1)
class addExpense extends HiveObject{
  @HiveField(0)
  int? id;
  @ HiveField(1)
  String category;
  @ HiveField(2)
  String expense;
  @ HiveField(3)
  String amount;
  @ HiveField(4)
  DateTime datetime;
  @ HiveField(5)
  String? note;
addExpense({
  required this.category,
  required this.expense,
  required this.amount,
  required this.datetime,
  this.note,
  this.id
});
}

@HiveType(typeId: 2)
class addIncome extends HiveObject{
  @HiveField(0)
  int? id;
  @ HiveField(1)
  String category;
  @ HiveField(2)
  String income;
  @ HiveField(3)
  String amount;
  @ HiveField(4)
  DateTime datetime;
  @ HiveField(5)
  String? note;
addIncome({
  required this.category,
  required this.income,
  required this.amount,
  required this.datetime,
  this.note,
  this.id
  });
  
}


@HiveType(typeId: 3)
class user extends HiveObject{
  @HiveField(0)
  int? id;
  @ HiveField(1)
  String name;
  @ HiveField(2)
  String phn;
  @ HiveField(3)
  String mail;
  @ HiveField(4)
  String password;
user({
  required this.name,
  required this.phn,
  required this.mail,
  required this.password,
  this.id
});

}