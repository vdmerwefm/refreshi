import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/data/graphql/refreshi_gql/operations.graphql.dart';
import 'package:refreshi/data/graphql/refreshi_storage/refreshi_storage.dart';

@lazySingleton
class RefreshiGqlLink extends Link {
  final RefreshiLocalStorage _refreshiLocalStorage;
  RefreshiGqlLink(this._refreshiLocalStorage);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    //fake network latency
    await Future<void>.delayed(const Duration(milliseconds: 300));
    try {
      switch (request.operation.operationName) {
        case 'GetServices':
          yield Response(
            response: {},
            data: Query$GetServices(
              services: _refreshiLocalStorage.getServices(),
            ).toJson(),
          );
        case 'GetOrder':
          final orders = Variables$Query$GetOrder.fromJson(request.variables);
          yield Response(
            response: {},
            data: Query$GetOrder(
              order: _refreshiLocalStorage.getOrderById(orders.id),
            ).toJson(),
          );
        case 'CreateOrder':
          final orders = Variables$Mutation$CreateOrder.fromJson(
            request.variables,
          );
          final createdOrder = await _refreshiLocalStorage.createOrder(
            orders.input!,
          );
          final mutuationOrder = Mutation$CreateOrder$createOrder.fromJson(
            createdOrder.toJson(),
          );
          yield Response(
            response: {},
            data: Mutation$CreateOrder(createOrder: mutuationOrder).toJson(),
          );
        default:
          throw InvalidLocalStorageException(
            'Unsupported operation: ${request.operation.operationName}',
          );
      }
    } catch (error) {
      yield Response(
        response: <String, dynamic>{},
        errors: [GraphQLError(message: error.toString())],
      );
    }
  }
}
