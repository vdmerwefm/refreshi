import 'package:fpdart/fpdart.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/data/enums/refreshi_gql_link_enums.dart';
import 'package:refreshi/data/graphql/refreshi_gql/operations.graphql.dart';
import 'package:refreshi/data/graphql/refreshi_gql/schema.graphql.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';
import 'package:refreshi/data/i_refreshi_repo/i_refreshi_repo.dart';
import 'package:refreshi/domain/refreshi_mappers/order_mapper.dart';
import 'package:refreshi/domain/refreshi_mappers/services_mapper.dart';

@injectable
class RefreshiRepo implements IRefreshiRepo {
  RefreshiRepo(this._graphQLClient);

  final GraphQLClient _graphQLClient;

  @override
  TaskEither<RefreshiFailure, List<RefreshiServiceDto>> getServices() {
    return TaskEither.tryCatch(() async {
      final rawdata = await _graphQLClient.query$GetServices(
        Options$Query$GetServices(
          operationName: RefreshiGqlLinkEnums.getServices.name,
        ),
      );

      if (rawdata.hasException) {
        throw MapServicesException();
      }
      if (rawdata.parsedData != null && rawdata.parsedData?.services != null) {
        return ServicesMapper.servicesToServicesDto(
          rawdata.parsedData!.services!,
        );
      } else {
        return <RefreshiServiceDto>[];
      }
    }, (error, stacktrace) => MapServicesException());
  }

  @override
  TaskEither<RefreshiFailure, RefreshiOrderDto> getOrder({required String id}) {
    return TaskEither.tryCatch(() async {
      final rawData = await _graphQLClient.query$GetOrder(
        Options$Query$GetOrder(
          operationName: RefreshiGqlLinkEnums.getOrder.name,
          variables: Variables$Query$GetOrder(id: id),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (rawData.hasException) {
        throw MapOrderException();
      }

      if (rawData.parsedData != null && rawData.parsedData?.order != null) {
        return OrderMapper.orderToOrderDto(rawData.parsedData!.order!);
      } else {
        return RefreshiOrderDto.empty();
      }
    }, (error, stacktrace) => MapOrderException());
  }

  @override
  TaskEither<RefreshiFailure, RefreshiOrderDto> createOrder({
    required String idempotencyKey,
    required List<String> serviceIds,
    required String cardToken,
    required String scheduledTime,
  }) {
    return TaskEither.tryCatch(() async {
      final rawData = await _graphQLClient.mutate$CreateOrder(
        Options$Mutation$CreateOrder(
          operationName: RefreshiGqlLinkEnums.createOrder.name,
          variables: Variables$Mutation$CreateOrder(
            input: Input$CreateOrderInput(
              idempotencyKey: idempotencyKey,
              scheduledTime: scheduledTime,
              cardToken: cardToken,
              serviceIds: serviceIds,
            ),
          ),
        ),
      );

      if (rawData.hasException) {
        throw MapCreateOrderException();
      }

      if (rawData.parsedData != null &&
          rawData.parsedData?.createOrder != null) {
        return OrderMapper.createOrderToOrderDto(
          rawData.parsedData!.createOrder,
        );
      } else {
        return RefreshiOrderDto.empty();
      }
    }, (error, stackTrace) => MapCreateOrderException());
  }
}
