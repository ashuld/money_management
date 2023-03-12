import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/model/data.dart';
import 'package:money_management/screens/income/addin.dart';
import 'package:money_management/screens/about/about.dart';
import 'package:money_management/screens/settings/settings.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(addExpenseAdapter().typeId)) {
    Hive.registerAdapter(addExpenseAdapter());
  }
  if (!Hive.isAdapterRegistered(addIncomeAdapter().typeId)) {
    Hive.registerAdapter(addIncomeAdapter());
  }
  if (!Hive.isAdapterRegistered(userAdapter().typeId)) {
    Hive.registerAdapter(userAdapter());
  }
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
      home: //ScreenCreateAccount()
      //ScreenTransactions() 
      //ScreenAddIncome() 
      //ScreenAddExpense()
      //ScreenCreateAccount() 
      //BottomNavigation() 
      //ScreenAbout()
      //ScreenTerms()
      ScreenSettings()
      //ScreenPrivacy()
      //const ScreenReport()  
      //ScreenSplash(),
    );
  }
}
