// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:graphql/client.dart' as _i763;
import 'package:injectable/injectable.dart' as _i526;
import 'package:refreshi/data/graphql/refreshi_gql_link/refreshi_gql_link.dart'
    as _i925;
import 'package:refreshi/data/graphql/refreshi_storage/refreshi_storage.dart'
    as _i226;
import 'package:refreshi/data/refreshi_repo/i_refreshi_repo.dart' as _i309;
import 'package:refreshi/di/register_module.dart' as _i430;
import 'package:refreshi/domain/refreshi_repo/refreahi_repo.dart' as _i763;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i763.GraphQLCache>(() => registerModule.graphQLCache);
    gh.lazySingleton<_i226.RefreshiLocalStorage>(
      () => _i226.RefreshiLocalStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i925.RefreshiGqlLink>(
      () => _i925.RefreshiGqlLink(gh<_i226.RefreshiLocalStorage>()),
    );
    gh.lazySingleton<_i763.GraphQLClient>(
      () => registerModule.graphQLClient(
        gh<_i925.RefreshiGqlLink>(),
        gh<_i763.GraphQLCache>(),
      ),
    );
    gh.lazySingleton<_i309.IRefreshiRepo>(
      () => _i763.RefreahiRepo(gh<_i763.GraphQLClient>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i430.RegisterModule {}
