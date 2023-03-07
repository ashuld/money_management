import 'package:flutter/material.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/userbackground.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenUser extends StatefulWidget {
  const ScreenUser({super.key});

  @override
  State<ScreenUser> createState() => _ScreenUser();
}

class _ScreenUser extends State<ScreenUser> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  FocusNode name_ =FocusNode();
  FocusNode phone_ =FocusNode();
  FocusNode username_ =FocusNode();
  FocusNode password_ =FocusNode();
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
    return  Scaffold(
       backgroundColor: Colors.indigo[50],
      body:SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            userBackground(context),
            Positioned(
              top: 120,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  height: 550,
                  width: 340,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          focusNode: name_,
                          controller: name,
                          decoration:  InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15
                            ),
                            labelText: 'Name',
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 51, 60, 141)
                              )
                            )
                          ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: phone_,
                          controller: phone,
                          decoration:  InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15
                            ),
                            labelText: 'Phone No.',
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 51, 60, 141)
                              )
                            )
                          ),
                          validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone No. Required';
                    }
                    return null;
                  },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: username_,
                          controller: username,
                          decoration:  InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 51, 60, 141)
                              )
                            )
                          ),
                          validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email Required';
                    }
                    return null;
                  },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        child: TextFormField(
                          maxLength: 6,
                          obscureText: obscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          focusNode: password_,
                          controller: password,
                          decoration:  InputDecoration(
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
                              horizontal: 15,
                              vertical: 15
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 51, 60, 141)
                              )
                            )
                          ),
                          validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Required';
                    }
                    return null;
                  },
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor: const Color.fromARGB(255, 51, 60, 141)
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isLogged', true);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavigation(),
                                ));
                          } 
                        }
                      ,
                      child: Text('Update',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo[50]
                      ),),
                      
                    ),
                      ],
                    ),
                  ),
              ),
            )
          ]
        ),
      )
    );
  }
}