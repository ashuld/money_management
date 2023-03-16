import 'package:flutter/material.dart';
import 'package:money_management/db/functions/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/register/create.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogIn extends StatefulWidget {
  const ScreenLogIn({super.key});

  @override
  State<ScreenLogIn> createState() => _ScreenLogInState();
}

class _ScreenLogInState extends State<ScreenLogIn> {
  var userid;
  var pasword;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  FocusNode usernameController_ = FocusNode();
  FocusNode passwordController_ = FocusNode();

  var formKey = GlobalKey<FormState>();
  bool error = false;
  bool obscure = true;

  @override
  void initState() {
    super.initState();
    usernameController_.addListener(() {
      setState(() {});
     });
     passwordController_.addListener(() {
      setState(() {});
     });
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      backgroundColor: secColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: ValueListenableBuilder(
              valueListenable: usernotifier,
              builder: (BuildContext context, List<UserModel>userlist, Widget? child,) {
                return SingleChildScrollView(
                child: Column(
                  children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username/Email required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.done,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    obscureText: obscure,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password required';
                      }
                      return null;
                    },
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
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: error,
                    child: const Text(
                      'Incorrect Username or Pin',
                      style: TextStyle(color: expensecol),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(
                            builder: (context) => const ScreenCreateAccount(),),);
                        }, 
                        child: const Text(
                          'Create an Account',
                          style: TextStyle(
                            color:  prColor
                          )),),
                        const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: prColor
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            for (var element in userlist) {
                              userid = element.mail;
                              pasword =element.password;
                            }
                            if ( usernameController.text == userid&&  pinController.text == pasword) {
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool('isLogged', true);
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(context, 
                              MaterialPageRoute(
                                builder: (context) => BottomNavigation(),
                                ), 
                                (route) => false);
                            } else {
                              setState(() {
                                error = true;
                              });
                              await Future.delayed(const Duration(seconds: 3));
                              setState(() {
                                error = false;
                              });
                            }
                          }
                        },
                        child: const Text('Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: secColor
                        ),),
                        
                      ),
                    ],
                  )
                ]),
              );
              },
            ),
          ),
        ),
      ),
    );
  }
}
