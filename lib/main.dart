import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management/screens/addcategory.dart';
import 'package:money_management/screens/addex.dart';
import 'package:money_management/screens/addin.dart';
import 'package:money_management/screens/all.dart';
import 'package:money_management/screens/create.dart';
import 'package:money_management/screens/report.dart';
import 'package:money_management/screens/splash.dart';
import 'package:money_management/widgets/bottomnavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      fontFamily: GoogleFonts.inder().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: //ScreenTransactions() 
      //ScreenAddIncome() 
      //ScreenCreateAccount() 
      BottomNavigation() 
      //const ScreenReport()  
      //const ScreenSplash(),
      //ScreenAddCategory()
      //const ScreenAddCategory()
    );
  }
}
