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
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
   await Hive.openBox<TransactionModel>(transactiondb);
   await Hive.openBox<UserModel>(userdb);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BudgetBuddy',
      theme: ThemeData(
          useMaterial3: true, fontFamily: GoogleFonts.inder().fontFamily),
      debugShowCheckedModeBanner: false,
      home: const ScreenSplash(),
    );
  }
}
