import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/presentation/auth_bloc/auth_bloc.dart';
import 'package:refreshi/presentation/refreshi_bloc/refreshi_bloc.dart';

class RefreshiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RefreshiAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.select((AuthBloc bloc) => bloc.state.isLoggedIn);
    return AppBar(
      title: InkWell(
        onTap: () => context.go(RefreshiRoutes.checkout),
        child: const Text('Refreshi'),
      ),
      actions: [
        //mobile has sign out under the order summary instead
        if (kIsWeb && isLoggedIn) ...[
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.mockLogout());
              context.read<RefreshiBloc>().add(
                const RefreshiEvent.resetCheckout(),
              );
            },
            child: const Text('Sign out'),
          ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }
}
