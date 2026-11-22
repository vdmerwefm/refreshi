import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/presentation/widgets/refreshi_app_bar.dart';
import 'package:refreshi/presentation/widgets/refreshi_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({this.message = 'Page not found', super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RefreshiAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            RefreshiButton(
              label: 'Back to checkout',
              onTap: () => context.go(RefreshiRoutes.checkout),
            ),
          ],
        ),
      ),
    );
  }
}
