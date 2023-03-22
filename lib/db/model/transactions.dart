// ignore_for_file: camel_case_types
import 'package:hive/hive.dart';
part 'transactions.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String type;
  @HiveField(2)
  String category;
  @HiveField(3)
  String name;
  @HiveField(4)
  double amount;
  @HiveField(5)
  DateTime datetime;
  @HiveField(6)
  String note;
  TransactionModel(
      {required this.type,
      required this.category,
      required this.name,
      required this.amount,
      required this.datetime,
      required this.note,
      this.id});
}
