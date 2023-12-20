import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in_screen.dart';
import 'package:taskapp/src/feature/account/presentation/sign_up_screen.dart';
import 'package:taskapp/src/feature/dashboard/presentation/DashboardScreen.dart';
import 'package:taskapp/src/feature/welcome/presentation/welcome.dart';
import 'package:taskapp/src/routing/not_found_screen.dart';

enum AppRoute {
  // products,
  // albums,
  // cart,
  welcome,
  signIn,
  signUp,
  dashboard
  // account,
  // orders,
  // todos,
  // dataScreen
}

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        name: AppRoute.welcome.name,
        builder: (BuildContext context, GoRouterState state) {
          return const Welcome();
        }),
    GoRoute(
        path: '/login',
        name: AppRoute.signIn.name,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        }),
    GoRoute(
        path: '/dashboard',
        name: AppRoute.dashboard.name,
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardScreenOne();
        }),
    GoRoute(
        path: '/signup',
        name: AppRoute.signUp.name,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        })
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
