import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in_screen.dart';
import 'package:taskapp/src/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in.dart';

// enum PageTransitionType {
//   fade,
//   rightToLeft,
//   leftToRight,
//   upToDown,
//   downToUp,
//   scale,
//   rotate,
//   size,
//   rightToLeftWithFade,
//   leftToRightWithFade,
// }

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Column(children: [
              Image.asset('assets/images/bruschetta-plate.jpg'),
              const Text(
                'Cake App',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ]),
            // splash: Icons.home,
            nextScreen: const SignInScreen(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            splashIconSize: 250,
            backgroundColor: const Color.fromARGB(255, 243, 117, 33)));
  }
}

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.redAccent,
//     );
//   }
// }
