import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/di/injection.config.dart';

final refreshiSl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => refreshiSl.init();
