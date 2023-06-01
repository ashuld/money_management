import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/constants/itemlist.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/functions/piechartcal.dart';
import 'package:money_management/screens/statistics/widgets/reportcontents.dart';
import 'package:money_management/widgets/widgets.dart';

class ScreenReport extends StatefulWidget {
  const ScreenReport({super.key});

  @override
  State<ScreenReport> createState() => _ScreenReportState();
}

class _ScreenReportState extends State<ScreenReport> {
  @override
  void initState() {
    super.initState();
    updatepie();
  }

  @override
  Widget build(BuildContext context) {
    refreshTransaction();
    return SafeArea(
      child: Scaffold(
        backgroundColor: secColor,
        body: RefreshIndicator(
          onRefresh: refreshTransaction,
          child: CustomScrollView(
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
      ),
    );
  }

  updatepie() {
    dataMap["Food"] = foodtotal();
    dataMap["Entertainment"] = entertainmenttotal();
    dataMap["Education"] = educationtotal();
    dataMap["Transportation"] = transportationtotal();
    dataMap["Personal Care"] = personalcaretotal();
    dataMap["Loans"] = loanstotal();
    dataMap["Medical"] = medicaltotal();
    dataMap["Other Expenses"] = otherexpensestotal();
    setState(() {});
  }
}
