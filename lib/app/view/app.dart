import 'package:flutter/material.dart';
import 'package:refreshi/app/bootstrap/app_providers.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/di/injection.dart';
import 'package:refreshi/presentation/auth_bloc/auth_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _authBloc = refreshiSl<AuthBloc>();
  late final _appRouter = AppRouter(_authBloc);

  @override
  void dispose() {
    _appRouter.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      authBloc: _authBloc,
      child: MaterialApp.router(
        title: 'Refreshi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //forces black text everywhere so it pops on the light background
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0F766E),
          ).copyWith(onSurface: Colors.black, onSurfaceVariant: Colors.black),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF4FBF8),
          dividerTheme: const DividerThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF4FBF8),
            scrolledUnderElevation: 0,
          ),
        ),
        routerConfig: _appRouter.config,
      ),
    );
  }
}
