import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';
import 'package:money_management/db/functions/db_functions.dart';
import 'package:money_management/db/model/userdata.dart';
import 'package:money_management/screens/edituser/widgets/edituserbg.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:money_management/widgets/widgets.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key, required this.userdatalist});
  final UserModel userdatalist;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  void initState() {
    name = TextEditingController(text: widget.userdatalist.name);
    phone = TextEditingController(text: widget.userdatalist.phn);
    username = TextEditingController(text: widget.userdatalist.mail);
    password = TextEditingController(text: widget.userdatalist.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secColor,
        body: SafeArea(
          child: Stack(alignment: Alignment.center, children: [
            editUserBackground(context),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: plain),
                height: MediaQuery.of(context).size.height * .78,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      customBox(height: 50.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                      box20(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
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
                      box20(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              if (value.contains('@gmail.com')) {
                                return null;
                              } else {
                                return 'Invalid email';
                              }
                            },
                          )),
                      box20(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            maxLength: 6,
                            obscureText: obscure,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
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
                                enabledBorder: unselectedBorder(),
                                focusedBorder: selectedBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Required';
                              }
                              return null;
                            },
                          )),
                      box10(),
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
                          child: secText600(data: 'Update')),
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
    if (phonedb.contains('-') ||
        phonedb.contains('.') ||
        phonedb.contains(',') ||
        phonedb.contains(' ') ||
        passworddb.contains('_') ||
        passworddb.contains('.') ||
        passworddb.contains(',') ||
        passworddb.contains(' ')) {
      showSnackBarr(context, 'Data contains Invalid Characters');
    } else {
      showToast(message: 'User Details Modified');
      final useredit = UserModel(
          id: widget.userdatalist.id,
          name: namedb,
          phn: phonedb,
          mail: usernamedb,
          password: passworddb);
      edituser(useredit);
      notify();
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          ));
    }
  }
}
