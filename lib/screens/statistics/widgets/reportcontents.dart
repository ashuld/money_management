import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/functions/piechartcal.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:pie_chart/pie_chart.dart';

Widget pieChart(context, dataMap) {
  return ValueListenableBuilder(
    valueListenable: transactionnotifier,
    builder: (context, List<TransactionModel> value, child) {
      refreshTransaction();
      var total = foodtotal() +
          entertainmenttotal() +
          educationtotal() +
          otherexpensestotal() +
          transportationtotal() +
          personalcaretotal() +
          loanstotal() +
          medicaltotal();
      return total == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: const [
                  SizedBox(
                      child: Text('No Data',
                          style: TextStyle(fontSize: 20, color: prColor))),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  PieChart(
                    chartType: ChartType.ring,
                    dataMap: dataMap,
                    chartLegendSpacing: 40,
                    ringStrokeWidth: 40,
                    chartRadius: MediaQuery.of(context).size.width * 0.8,
                    colorList: chartcolor,
                    centerText: 'Expense',
                    legendOptions: const LegendOptions(
                        showLegendsInRow: true,
                        legendTextStyle: TextStyle(
                            color: prColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        legendPosition: LegendPosition.bottom),
                    chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: true,
                        decimalPlaces: 1,
                        showChartValuesOutside: false,
                        chartValueBackgroundColor: secColor,
                        chartValueStyle: TextStyle(
                            color: prColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            );
    },
  );
}
