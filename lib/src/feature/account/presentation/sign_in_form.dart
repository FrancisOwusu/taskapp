import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taskapp/src/utils/custom_snackbar.dart';
import 'package:taskapp/src/utils/logger.dart';

final log = logger(SignInForm);

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormFields();
}

class _SignInFormFields extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // of the TextField.
  final myController = TextEditingController();

  // void _printLatestValue() {
  //   final text = myController.text;
  //   print('Second text field: $text (${text.characters.length})');
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        // crossAxisAlignment: CrossAxisAlignment.start,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                // controller: TextEditingController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: ElevatedButton(
                onPressed: _postForm,
                child: const Text('submit'),
              ),
            )
          ],
        ));
  }

  void _postForm() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      log.i(emailController.text);
      log.i(passwordController.text);

      CustomSnackBar.success("fgg");
    } else {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      CustomSnackBar.error("Something went wrong,contact admin");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Processing Data')),
      // );
    }

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     // ignore: prefer_const_constructors
    //     return AlertDialog(
    //       // Retrieve the text the that user has entered by using the
    //       // TextEditingController.
    //       // content: Text(myController.text),
    //       content: const Text("test"),
    //     );
    //   },
    // );

    // }
  }
}
