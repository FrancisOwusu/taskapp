import 'package:flutter/material.dart';
import 'package:taskapp/src/utils/logger.dart';

final log = logger(SignIn);

// Define a custom Form widget.
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<SignIn> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: MyFormFields(),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              // ignore: prefer_const_constructors
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                // content: Text(myController.text),
                content: const Text("test"),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class MyFormFields extends StatelessWidget {
  MyFormFields({super.key});
  // final myController = TextEditingController();
  // final username = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              // if (_formKey.currentState!.validate()) {
              if (_formKey.currentState!.validate()) {
                //navigation
              } else {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
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
            },
            child: const Text('submit'),
          ),
        )
      ],
    );
  }
}
