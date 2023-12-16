import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskapp/src/feature/account/controller/account_controller.dart';
import 'package:taskapp/src/utils/logger.dart';
import 'package:taskapp/src/utils/notification_util.dart';

final log = logger(SignInForm);

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormFields();
}

class _SignInFormFields extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  AccountController _accountController = AccountController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  Bool? isEmailAlreadyRegistered;
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

  void init() {
    // hideKeyboard(context);
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   Map req = {
    //     'email': emailController.text.trim(),
    //     'password': passwordController.text.trim(),
    //   };
    // }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = emailController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
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
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  // validator: (String? value) {
                  //   if (!_emailRegex.hasMatch(value!)) {
                  //     return 'Email address is not valid';
                  //   }
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter email';
                  //   }

                  //   return null;
                  // },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                // obscureText: passwordVisible,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                ),
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter password';
                //   }
                //   return null;
                // },
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
      Map<String, dynamic> inputBody = {
        'email': emailController.text,
        'password': passwordController.text
      };
      // log.i(emailController.text);
      // log.i(passwordController.text);
      NotificationUtil.snackBarError(message: "essssss");
      AccountController.signUp(body: inputBody);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('snack'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ));
    }
  }
}
