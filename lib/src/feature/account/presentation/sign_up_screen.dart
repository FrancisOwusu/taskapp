import 'package:flutter/material.dart';
import 'package:taskapp/src/feature/account/presentation/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text("Task App"),
      // ),
      body: SignUpForm(),
    );
  }
}
