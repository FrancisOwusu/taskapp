import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
// import 'package:itestapp/src/features/album/presentation/album_screen.dart';
// import 'package:itestapp/src/features/album/presentation/create_album_screen.dart';
// import 'package:itestapp/src/features/data_screen/presentation/retrieve_data_screen.dart';
// import 'package:itestapp/src/features/products/presentation/product_grid.dart';
// import 'package:itestapp/src/features/todos/domain/todo.dart';
// import 'package:itestapp/src/features/todos/presentation/todos_screen.dart';
// import 'package:itestapp/src/features/todos/sample.dart';
// import 'package:taskapp/src/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in.dart';
import 'package:taskapp/src/feature/account/presentation/sign_in_screen.dart';
import 'package:taskapp/src/feature/welcome/presentation/welcome.dart';
// import 'package:itestapp/src/pages/register.dart';
// import 'package:itestapp/src/pages/show.dart';
import '/src/routing/not_found_screen.dart';

enum AppRoute {
  dashoard,
  // products,
  // albums,
  // cart,
  signIn,
  // account,
  // orders,
  // todos,
  // dataScreen
}

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.dashoard.name,
      builder: (BuildContext context, GoRouterState state) {
        return const Welcome();
        // return const DashboardScreen();
        // return const AlbumScreen();
        // return const ProductGrid();
        // , return const RetrieveDataScreen();
        //// return TodosScreen(todos: todos);
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'login',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: const SignInScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    // Change the opacity of the screen using a Curve based on the the animation's
                    // value
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  });
            }),
      ],
    ),
//int
    // GoRoute(
    //   path: '/products',
    //   name: AppRoute.products.name,
    //   builder: (context, state) => const ProductGrid(),
    //   // routes: [
    //   //   GoRoute(
    //   //     path: '/:id',
    //   //     name: AppRoute.products.name,
    //   //     builder: (context, state) {
    //   //       final productId = state.pathParameters['id']!;
    //   //       return ProductScreen(productId: productId);
    //   //     },
    //   //   )
    //   // ]
    // ),
    // GoRoute(
    //     path: '/todos',
    //     pageBuilder: (context, state) {
    //       return CustomTransitionPage(
    //         key: state.pageKey,
    //         child: TodosScreen(todos: todos),
    //         transitionsBuilder:
    //             (context, animation, secondaryAnimation, child) {
    //           // Change the opacity of the screen using a Curve based on the the animation's
    //           // value
    //           return FadeTransition(
    //             opacity:
    //                 CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    //             child: child,
    //           );
    //         },
    //       );
    //     }),
    // GoRoute(
    //     path: '/register',
    //     pageBuilder: (context, state) {
    //       return CustomTransitionPage(
    //         key: state.pageKey,
    //         child: const MyCustomForm(),
    //         transitionsBuilder:
    //             (context, animation, secondaryAnimation, child) {
    //           // Change the opacity of the screen using a Curve based on the the animation's
    //           // value
    //           return FadeTransition(
    //             opacity:
    //                 CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    //             child: child,
    //           );
    //         },
    //       );
    //     }),

    //  int
    // GoRoute(
    //   path: 'register',
    //   pageBuilder: (context, state) =>
    //       MaterialPage(child: const RegistrationForm),
    // )
    //errorBuilder: (context, state) => ErrorScreen(state.error),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
