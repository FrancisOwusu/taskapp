import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/src/feature/account/controller/account_controller.dart';
import 'package:taskapp/src/feature/account/domain/auth_model.dart';
import 'package:taskapp/src/feature/account/domain/register_model.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in_screen.dart';

import 'package:taskapp/src/feature/account/service/account_service.dart';
import 'package:taskapp/src/store/local_storage.dart';
import 'package:taskapp/src/utils/logger.dart';
import 'package:taskapp/src/utils/notification_util.dart';

final log1 = logger(SignInForm);

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormFields();
}

final log2 = logger(_SignInFormFields);

class _SignInFormFields extends State<SignInForm> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Flutter Login/Logout'),
        // ),
        body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Image.network(
                  'http://blog.back4app.com/wp-content/uploads/2017/11/logo-b4a-1-768x175-1.png'),
            ),
            const Center(
              child: Text('Flutter on Back4App',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text('User Login/Logout', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controllerUsername,
              enabled: !isLoggedIn,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Username'),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: controllerPassword,
              enabled: !isLoggedIn,
              obscureText: true,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: isLoggedIn ? null : () => doUserLogin(),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: !isLoggedIn ? null : () => doUserLogout(),
                child: const Text('Logout'),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();
    // Map<String, dynamic> req = {'email': username, 'password': password};
    late AuthModel authModel;
    await AccountService.loginApi(
        body: {'email': username, 'password': password}).then((value) {
      authModel = value!;
      if (authModel.token.isNotEmpty || authModel.token != '') {
        isLoggedIn = true;
        String? token = authModel.token;
        LocalStorage.saveToken(token: token.toString());
        LocalStorage.isLoginSuccess(isLoggedIn: true);
        LocalStorage.isLoggedIn();
        log2.e(token);
        showSuccess("User was successfully login!");
        setState(() {
          isLoggedIn = true;
        });
        context.go('/dashboard');
      } else {
        showError("Unable to log user in,contact admin");
      }
    }).catchError((onError) {
      log2.e(onError);
    });
  }

  void doUserLogout() async {
    AccountService.signOut();

    if (isLoggedIn) {
      showSuccess("Logout Successful");
      // context.of;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    }
  }
}
