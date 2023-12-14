import 'package:flutter/material.dart';
import 'package:taskapp/src/constants/app_config.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task App"),
      ),
      body: const SignInForm(),
    );
  }
}
