// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/widgets.dart';

Future<void> alertMessage(BuildContext context, {required String id}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete !', style: TextStyle(color: prColor)),
        content: const Text('Are you Sure?', style: TextStyle(color: prColor)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No', style: TextStyle(color: prColor))),
          TextButton(
              onPressed: () async {
                deleteTransaction(id);
                await refreshTransaction();
                refreshTransaction();
                showToast(message: 'Deleted');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigation(),));
              },
              child: const Text('Yes', style: TextStyle(color: prColor)))
        ],
      );
    },
  );
}
