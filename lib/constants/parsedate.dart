import 'package:intl/intl.dart';

String parseDate(DateTime date) {
  final parsedDate = DateFormat.yMMMd().format(date);
  final splittedDate = parsedDate.split(' ');
  return '${splittedDate.elementAt(1)} ${splittedDate.elementAt(0)} ${splittedDate.elementAt(2)}';
}
