import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management/screens/about/about.dart';
import 'package:money_management/screens/category/addcategory.dart';
import 'package:money_management/screens/expense/addex.dart';
import 'package:money_management/screens/income/addin.dart';
import 'package:money_management/screens/privacy/privacy.dart';
import 'package:money_management/screens/terms/terms.dart';
import 'package:money_management/screens/transactions/all.dart';
import 'package:money_management/screens/register/create.dart';
import 'package:money_management/screens/statistics/report.dart';
import 'package:money_management/screens/splash/splash.dart';
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
      //BottomNavigation() 
      //ScreenAbout()
      //ScreenTerms()
      //ScreenPrivacy()
      //const ScreenReport()  
      const ScreenSplash(),
      //ScreenAddCategory()
      //const ScreenAddCategory()
    );
  }
}
