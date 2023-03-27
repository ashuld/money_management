import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/widgets/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

Widget pieChart(context, dataMap) {
  return ValueListenableBuilder(
    valueListenable: transactionnotifier,
    builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width * 0.8,
              colorList: const [
                food,
                entertainment,
                education,
                transportation,
                personalcare,
                loans,
                medical,
                otherexpense,
              ],
              legendOptions: const LegendOptions(
                  showLegendsInRow: true,
                  legendTextStyle: TextStyle(
                      color: prColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  legendPosition: LegendPosition.bottom),
              chartValuesOptions:
                  const ChartValuesOptions(showChartValuesInPercentage: true),
            )
          ],
        ),
      );
    },
  );
}

Widget spending() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Top Spendings',
            style: TextStyle(
                color: prColor, fontSize: 16, fontWeight: FontWeight.bold)),
        prIcon(icon: Icons.swap_vert, size: 25.0)
      ],
    ),
  );
}
