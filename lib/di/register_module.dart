import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/data/graphql/refreshi_gql_link/refreshi_gql_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  GraphQLCache get graphQLCache => GraphQLCache();

  @lazySingleton
  GraphQLClient graphQLClient(RefreshiGqlLink link, GraphQLCache cache) =>
      GraphQLClient(link: link, cache: cache);
}
