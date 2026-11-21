import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refreshi/app/view/app.dart';
import 'package:refreshi/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Clean URLs on web (/orders/123 instead of /#/orders/123). No-op on mobile.
  usePathUrlStrategy();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await configureDependencies();
  runApp(const App());
}
