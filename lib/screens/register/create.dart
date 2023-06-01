import 'package:flutter/material.dart';
import 'package:money_management/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/createbackground.dart';

class ScreenCreateAccount extends StatefulWidget {
  const ScreenCreateAccount({super.key});

  @override
  State<ScreenCreateAccount> createState() => _ScreenCreateAccountState();
}

class _ScreenCreateAccountState extends State<ScreenCreateAccount> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secColor,
        body: SafeArea(
          child: Stack(alignment: Alignment.center, children: [
            createBackground(context),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: plain),
                height: MediaQuery.of(context).size.height * .78,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    customBox(height: 50.0),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          controller: name,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: unselectedBorder(),
                              focusedBorder: selectedBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name Required';
                            }
                            return null;
                          },
                        )),
                    box30(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          controller: phone,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Phone No.',
                              labelStyle: const TextStyle(
                                  fontSize: 17, color: unselected),
                              enabledBorder: unselectedBorder(),
                              focusedBorder: selectedBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone No. Required';
                            }
                            if (value.length > 10 || value.length < 10) {
                              return 'Invalid Phone Number';
                            }
                            return null;
                          },
                        )),
                    box30(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          controller: username,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: unselectedBorder(),
                              focusedBorder: selectedBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            }
                            final parts = value.split('@');
                            if (parts.length != 2 || parts[1] != 'gmail.com') {
                              return 'Invalid email';
                            }
                            if (parts[0].isEmpty) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        )),
                    box30(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: prColor),
                        onPressed: () async {
                          onbuttonclick();
                        },
                        child: secText600(data: 'Get Started')),
                  ],
                ),
              ),
            )
          ]),
        ));
  }

  Future<void> onbuttonclick() async {
    final namedb = name.text.trim();
    final phonedb = phone.text.trim();
    final usernamedb = username.text;
    // final passworddb = password.text;
    if (namedb.isEmpty) {
      showSnackBarr(context, 'Invalid Name');
    } else if (phonedb.contains('-') ||
            phonedb.contains('.') ||
            phonedb.contains(',') ||
            phonedb.contains(' ')
        // ||passworddb.contains('_') ||
        // passworddb.contains('.') ||
        // passworddb.contains(',') ||
        // passworddb.contains(' ')
        ) {
      showSnackBarr(context, 'Phone No. contains Invalid Characters');
    } else {
      showToast(message: 'Account Created');
      reset();
      final userdetails = UserModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: namedb,
        phn: phonedb,
        mail: usernamedb,
        // password: passworddb
      );
      adduser(userdetails);
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogged', true);
// ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          ));
    }
  }
}
