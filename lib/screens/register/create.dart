import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/login/login.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/createbackground.dart';

class ScreenCreateAccount extends StatefulWidget {
  const ScreenCreateAccount({super.key});

  @override
  State<ScreenCreateAccount> createState() => _ScreenCreateAccountState();
}

late String myname;

class _ScreenCreateAccountState extends State<ScreenCreateAccount> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  FocusNode name_ = FocusNode();
  FocusNode phone_ = FocusNode();
  FocusNode username_ = FocusNode();
  FocusNode password_ = FocusNode();
  var formKey = GlobalKey<FormState>();
  bool obscure = true;
  @override
  void initState() {
    super.initState();
    name_.addListener(() {
      setState(() {});
    });
    phone_.addListener(() {
      setState(() {});
    });
    username_.addListener(() {
      setState(() {});
    });
    password_.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[50],
        body: SafeArea(
          child: Stack(alignment: Alignment.center, children: [
            createBackground(context),
            Positioned(
              top: 120,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                height: 550,
                width: 340,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          focusNode: name_,
                          controller: name,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: phone_,
                          controller: phone,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Phone No.',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Phone No. Required';
                            }
                            if (value.length > 10 || value.length < 10) {
                              return 'Invalid Phone Number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          focusNode: username_,
                          controller: username,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            }
                            if (value.contains('@')) {
                              return null;
                            } else {
                              return 'Invalid email';
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          maxLength: 6,
                          obscureText: obscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: password_,
                          controller: password,
                          decoration: InputDecoration(
                              suffixIcon: obscure == true
                                  ? IconButton(
                                      icon: const Icon(Icons.lock_outline),
                                      onPressed: () {
                                        setState(() {
                                          obscure = false;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: const Icon(Icons.lock_open_sharp),
                                      onPressed: () {
                                        setState(() {
                                          obscure = true;
                                        });
                                      },
                                    ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontSize: 17,
                                color: unselected,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2, color: unselected),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 2, color: prColor))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: prColor),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            onbuttonclick();
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: secColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const ScreenLogIn(),));
                        }, 
                        child: const Text("Login!"))
                    ],
                  ),
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
    final passworddb = password.text;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: prColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Account Created',
          style: TextStyle(fontStyle: FontStyle.italic, color: secColor),
        )));
        reset();
    final userdetails = UserModel(
        name: namedb, phn: phonedb, mail: usernamedb, password: passworddb);
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
