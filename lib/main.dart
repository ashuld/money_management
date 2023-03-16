import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/transactions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/splash/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(IncomeModelAdapter().typeId)) {
    Hive.registerAdapter(IncomeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
   Hive.openBox<ExpenseModel>(expensedb);
  // await Hive.openBox<addIncome>('incomedb');
  // await Hive.openBox<user>('usedb');
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
      //ScreenSettings()
      //ScreenPrivacy()
      //const ScreenReport()  
      ScreenSplash(),
    );
  }
}
