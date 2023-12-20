import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/src/feature/account/controller/account_controller.dart';
// import 'package:taskapp/src/feature/account/domain/register_model.dart';
// import 'package:taskapp/src/feature/account/service/account_service.dart';
import 'package:taskapp/src/store/local_storage.dart';
import 'package:taskapp/src/utils/logger.dart';
// import 'package:taskapp/src/utils/notification_util.dart';

final log1 = logger(SignUpForm);

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});
  @override
  State<SignUpForm> createState() => _SignUpFormFields();
}

final log2 = logger(_SignUpFormFields);

class _SignUpFormFields extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  Map<String, dynamic> inputBody = {};
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLatestValue);
  }

  void init() {
    // hideKeyboard(context);
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
                  validator: (String? value) {
                    if (!_emailRegex.hasMatch(value!)) {
                      return 'Email address is not valid';
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }

                    return null;
                  },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Sign Up'),
              ),
            )
          ],
        ));
  }

  void _submit() {
    // NotificationUtil.toast('Test');
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      inputBody = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      };
      log2.i('sd');
      _signUpProcess();
      log2.i('sd1');
      AccountController.signUpProcess(inputBody);
      log2.i('sd2');
      _signUpProcess();

      // NotificationUtil.snackBarError(message: "All fields are required");
    } else {
      // NotificationUtil.snackBarError(context,
      //     message: "All fields are required");
    }
  }

  void _signUpProcess() {
    log2.i('sd3');
    log2.i(LocalStorage.isLoggedIn());
    if (LocalStorage.isLoggedIn()) {
      context.go('/dasboard');
    }

    ;
    log2.i(LocalStorage.getToken());
    log2.i(LocalStorage.isLoginSuccess(isLoggedIn: true));
    log2.i('sd4');
    // debugPrint(res as String?);
  }
}
