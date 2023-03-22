import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/widgets/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

Widget pieChart(context, dataMap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        PieChart(
          dataMap: dataMap,
          chartRadius: MediaQuery.of(context).size.width,
          legendOptions: const LegendOptions(
              legendTextStyle: TextStyle(
                  color: prColor, fontWeight: FontWeight.bold, fontSize: 16),
              legendPosition: LegendPosition.right),
          chartValuesOptions:
              const ChartValuesOptions(showChartValuesInPercentage: true),
        )
      ],
    ),
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
