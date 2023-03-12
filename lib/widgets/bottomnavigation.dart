import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/screens/home/home.dart';
import 'package:money_management/screens/statistics/report.dart';
import 'package:money_management/widgets/bottomsheet.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexColour = 0;
  List screen = [ ScreenHome(),const ScreenReport()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[indexColour],
      backgroundColor: secColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: prColor,
            context: context, 
            builder: (BuildContext ctx) {
              return bottomSheet(ctx);
            },);
      },
      backgroundColor: prColor,
      child: const Icon(Icons.add,
      color: secColor,
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 7.5,
            bottom: 7.5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColour = 0;
                  });
                },
                child:  Icon(
                  Icons.home,
                  size: 30,
                  color: indexColour == 0 ? prColor:unselected,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexColour = 1;
                  });
                },
                child:  Icon(
                  Icons.pie_chart_outline_outlined,
                  size: 30,
                  color: indexColour == 1 ? prColor:unselected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}