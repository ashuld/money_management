import 'package:flutter/material.dart';
import 'package:money_management/widgets/addcabackground.dart';

class ScreenAddCategory extends StatefulWidget {
  const ScreenAddCategory({super.key});

  @override
  State<ScreenAddCategory> createState() => _ScreenAddCategoryState();
}

class _ScreenAddCategoryState extends State<ScreenAddCategory> {
  final TextEditingController category = TextEditingController();
  FocusNode category_ = FocusNode();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          categoryBackground(context),
          Positioned(
            top: 120,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              height: 550,
              width: 340,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 70,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 51, 60, 141)),
                      onPressed: () {},
                      child: Text(
                        'Choose Image',
                        style: TextStyle(color: Colors.indigo[50]),
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
                        focusNode: category_,
                        controller: category,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            labelText: 'Category',
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(width: 2, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 51, 60, 141)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Category Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 51, 60, 141)
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()){

                              }
                            }, 
                            child: Text('Add Category',
                            style: TextStyle(
                              color: Colors.indigo[50]
                            ),
                            )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
