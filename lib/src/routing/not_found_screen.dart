import 'package:flutter/material.dart';
import 'package:taskapp/src/common_widgets/empty_placeholder_widget.dart';
import 'package:taskapp/src/common/app_sizes.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const EmptyPlaceHolderWidget(
        message: '404 - Page not found!',
        // message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}
