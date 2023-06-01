import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/screens/search/widgets/daterangefilter.dart';
import 'package:money_management/screens/search/widgets/searchresult.dart';

var filterListener = transactionfilternotifier;

class ScreenSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: const AppBarTheme(
      color: secColor,
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.close,
            color: prColor,
          )),
      PopupMenuButton(
        color: secColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: const Icon(
          Icons.calendar_month_rounded,
          color: prColor,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value;
              },
              child: const Text(
                'All',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value
                    .where((element) =>
                        element.datetime.day == DateTime.now().day &&
                        element.datetime.month == DateTime.now().month &&
                        element.datetime.year == DateTime.now().year)
                    .toList();
              },
              child: const Text(
                'Today',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value
                    .where((element) =>
                        element.datetime.day == DateTime.now().day - 1 &&
                        element.datetime.month == DateTime.now().month &&
                        element.datetime.year == DateTime.now().year)
                    .toList();
              },
              child: const Text(
                'Yesterday',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                final today = DateTime.now();
                final lastweek = today.subtract(const Duration(days: 7));
                filterListener.value = transactionfilternotifier.value
                    .where((element) => element.datetime.isAfter(lastweek))
                    .toList();
              },
              child: const Text(
                'Last Week',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                if (first == null || second == null) {
                  return;
                } else {
                  await refreshTransaction();
                  filterListener.value = transactionfilternotifier.value
                      .where((element) =>
                          element.datetime.isAfter(
                              first!.subtract(const Duration(days: 1))) &&
                          element.datetime
                              .isBefore(second!.add(const Duration(days: 1))))
                      .toList();
                }
              },
              child: const WidgetDateRangePicker())
        ],
      ),
      PopupMenuButton(
        color: secColor,
        icon: const Icon(
          Icons.more_vert,
          color: prColor,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value;
              },
              child: const Text(
                'All',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value
                    .where((element) => element.type == 'Income')
                    .toList();
              },
              child: const Text(
                'Income',
                style: TextStyle(color: prColor),
              )),
          PopupMenuItem(
              onTap: () async {
                await refreshTransaction();
                filterListener.value = transactionfilternotifier.value
                    .where((element) => element.type == 'Expense')
                    .toList();
              },
              child: const Text(
                'Expense',
                style: TextStyle(color: prColor),
              ))
        ],
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: prColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return WidgetSearchResult(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return WidgetSearchResult(query: query);
  }
}
