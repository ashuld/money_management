
import 'package:money_management/db/functions/piechartcal.dart';

List<String> categoryitem = [
  'Food',
  'Entertainment',
  'Education',
  'Transportation',
  'Personal Care',
  'Loans',
  'Medical',
  'Other Expenses',
  'Salary',
  'Other Income'
];

List<String> type = ['Expense', 'Income'];

List<String> mon = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

Map<String, double> dataMap = {
    "Food": foodtotal(),
    "Entertainment": entertainmenttotal(),
    "Education": educationtotal(),
    "Transportation":transportationtotal(),
    "Personal Care":personalcaretotal(),
    "Loans":loanstotal(),
    "Medical":medicaltotal(),
    "Other Expenses":otherexpensestotal(),
  };