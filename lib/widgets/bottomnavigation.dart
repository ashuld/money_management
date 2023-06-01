import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/screens/addtransaction/addtr.dart';
import 'package:money_management/screens/home/home.dart';
import 'package:money_management/screens/statistics/report.dart';
import 'package:money_management/widgets/widgets.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexColour = 0;
  List screen = [const ScreenHome(), const ScreenReport()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[indexColour],
      backgroundColor: secColor,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAddTransaction(),
                ));
          },
          backgroundColor: prColor,
          child: secIcon(icon: Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColour = 0;
                    });
                  },
                  child: customIcon(
                      icon: Icons.home,
                      size: 30.0,
                      color: indexColour == 0 ? prColor : unselected)),
              customBox(width: 40.0),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColour = 1;
                    });
                  },
                  child: customIcon(
                      color: indexColour == 1 ? prColor : unselected,
                      icon: Icons.pie_chart_outline_outlined,
                      size: 30.0)),
            ],
          ),
        ),
      ),
    );
  }
}
