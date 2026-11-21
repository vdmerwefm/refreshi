import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refreshi/di/injection.dart';
import 'package:refreshi/presentation/refreshi_bloc/refreshi_bloc.dart';
import 'package:refreshi/presentation/auth_bloc/auth_bloc.dart';

/// App-wide blocs, resolved from get_it (same pattern as pokemon_base).
class AppProviders extends StatelessWidget {
  const AppProviders({required this.authBloc, required this.child, super.key});

  /// Owned by [App] because the router also needs it for redirects.
  final AuthBloc authBloc;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider(
          create: (context) =>
              refreshiSl<RefreshiBloc>()
                ..add(const RefreshiEvent.getRefreshiServices()),
        ),
      ],
      child: child,
    );
  }
}
