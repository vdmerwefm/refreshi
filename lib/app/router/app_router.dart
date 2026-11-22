import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/presentation/auth_bloc/auth_bloc.dart';
import 'package:refreshi/presentation/pages/checkout_page.dart';
import 'package:refreshi/presentation/pages/not_found_page.dart';
import 'package:refreshi/presentation/pages/order_details_page.dart';
import 'package:refreshi/presentation/pages/sign_in_page.dart';

abstract final class RefreshiRoutes {
  static const checkout = '/';
  static const signIn = '/sign-in';
  static String order(String id) => '/orders/${Uri.encodeComponent(id)}';

  static String signInFrom(String from) =>
      Uri(path: signIn, queryParameters: {'from': from}).toString();
}

//url is the source of truth so deep links and refresh rebuild the same screen
class AppRouter {
  AppRouter(this._authBloc);

  final AuthBloc _authBloc;

  late final GoRouter config = GoRouter(
    initialLocation: RefreshiRoutes.checkout,
    refreshListenable: _StreamListenable(_authBloc.stream),
    redirect: _redirect,
    errorBuilder: (context, state) => const NotFoundPage(),
    routes: [
      GoRoute(
        path: RefreshiRoutes.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: RefreshiRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/orders/:orderId',
        builder: (context, state) => OrderDetailsPage(
          //new id, new page and a fresh bloc
          key: ValueKey(state.pathParameters['orderId']),
          orderId: state.pathParameters['orderId']!,
        ),
      ),
    ],
  );

  String? _redirect(BuildContext context, GoRouterState state) {
    final signedIn = _authBloc.state.isLoggedIn;
    final onSignIn = state.matchedLocation == RefreshiRoutes.signIn;
    //checkout is public, only order routes need sign in
    final onOrderRoute = state.matchedLocation.startsWith('/orders/');

    if (!signedIn && onOrderRoute) {
      //keep the return path in the url so it survives a refresh on sign in
      return RefreshiRoutes.signInFrom(state.uri.toString());
    }

    if (signedIn && onSignIn) {
      final from = state.uri.queryParameters['from'];
      //only allow in app paths, stops open redirects
      final safe =
          from != null && from.startsWith('/') && !from.startsWith('//');
      return safe ? from : RefreshiRoutes.checkout;
    }

    return null;
  }

  void dispose() => config.dispose();
}

class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
