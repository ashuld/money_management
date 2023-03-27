import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/screens/statistics/widgets/reportcontents.dart';
import 'package:money_management/widgets/widgets.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  @override
  Widget build(BuildContext context) {
    refreshTransaction();
    return SafeArea(
      child: Scaffold(
        backgroundColor: secColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  box20(),
                  prText600(data: 'Statistics', size: 20.0),
                  box20(),
                  customBox(height: 30.0),
                  pieChart(context, dataMap),
                  box20(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
