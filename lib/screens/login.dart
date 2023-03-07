import 'package:flutter/material.dart';
import 'package:money_management/screens/create.dart';
import 'package:money_management/screens/home.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogIn extends StatefulWidget {
  const ScreenLogIn({super.key});

  @override
  State<ScreenLogIn> createState() => _ScreenLogInState();
}

class _ScreenLogInState extends State<ScreenLogIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool error = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: usernameController,
                  maxLength: 8,
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
                  maxLength: 4,
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
                    style: TextStyle(color: Colors.red),
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
                          color:  Color.fromARGB(255, 51, 60, 141)
                        )),),
                      const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 51, 60, 141)
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (usernameController.text == "ashish" &&
                              pinController.text == '1234') {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isLogged', true);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavigation(),
                                ));
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
                      child: Text('Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo[50]
                      ),),
                      
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
