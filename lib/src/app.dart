import 'package:flutter/material.dart';
import 'package:taskapp/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// The route configuration.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task App',
      routerConfig: router,
      // home: MyCustomForm(),
    );
  }
}
