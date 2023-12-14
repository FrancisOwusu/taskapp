import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/src/constants/app_config.dart';
import 'package:taskapp/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// The route configuration.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConfig.appName,
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routerConfig: router,
          // home: child,
        );
      },
      // child: const HomePage(title: 'First Method'),
    );
  }
}
