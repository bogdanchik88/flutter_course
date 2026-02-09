import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> globalKey = GlobalKey();

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  String? selectedValue;
  bool? checkBoxValue = false;

  String radioValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: globalKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            autofocus: true,
                            controller: loginTextFieldController,
                            decoration: InputDecoration(hintText: "Login"),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              ),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите логин';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordTextFieldController,
                            decoration: InputDecoration(hintText: "Password"),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите пароль';
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            value: selectedValue,
                            items: [
                              DropdownMenuItem(
                                child: Text("Usa"),
                                value: "usa",
                              ),
                              DropdownMenuItem(child: Text("Ru"), value: "ru"),
                              DropdownMenuItem(child: Text("dd"), value: "dd"),
                              DropdownMenuItem(child: Text("ss"), value: "ss"),
                              DropdownMenuItem(child: Text("eu"), value: "eu"),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            tristate: true,
                            value: checkBoxValue,
                            onChanged: (value) {
                              setState(() {
                                checkBoxValue = value ?? false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Radio(
                            groupValue: radioValue,
                            value: "1",
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Radio(
                            groupValue: radioValue,
                            value: "2",
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Radio(
                            groupValue: radioValue,
                            value: "3",
                            onChanged: (value) {
                              setState(() {
                                radioValue = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: submitForm,
                          child: Text("Войти"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    if (globalKey.currentState?.validate() ?? false) {
      //   final result = await showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         actions: [
      //           ElevatedButton(
      //             onPressed: () {
      //               Navigator.of(context).pop(true);
      //             },
      //             child: Text("Ok"),
      //           ),
      //           ElevatedButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             child: Text("Отмена"),
      //           ),
      //         ],
      //         title: Text("Данные:"),
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("Login: ${loginTextFieldController.text}"),
      //             Text("Password: ${passwordTextFieldController.text}"),
      //           ],
      //         ),
      //       );
      //     },
      //   );

      //   print(result);

      final snackBar = SnackBar(
        action: SnackBarAction(label: "ok", onPressed: () {}),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login: ${loginTextFieldController.text}"),
            Text("Password: ${passwordTextFieldController.text}"),
          ],
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
