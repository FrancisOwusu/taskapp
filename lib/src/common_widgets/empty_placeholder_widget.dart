import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskapp/src/common_widgets/primary_button.dart';
import 'package:taskapp/src/common/app_sizes.dart';
import 'package:taskapp/src/localization/string_hardcoded.dart';
import 'package:taskapp/src/routing/app_router.dart';

class EmptyPlaceHolderWidget extends StatelessWidget {
  const EmptyPlaceHolderWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () => context.goNamed(AppRoute.dashoard.name),
              text: 'Go Home'.hardcoded,
            )
          ],
        ),
      ),
    );
  }
}
