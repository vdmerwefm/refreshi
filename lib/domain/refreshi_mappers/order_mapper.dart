import 'package:refreshi/data/graphql/refreshi_gql/operations.graphql.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_mappers/services_mapper.dart';

class OrderMapper {
  static RefreshiOrderDto orderToOrderDto(Query$GetOrder$order rawOrder) {
    return RefreshiOrderDto(
      id: rawOrder.id,
      idempotencyKey: rawOrder.idempotencyKey,
      scheduledTime: DateTime.tryParse(rawOrder.scheduledTime) ?? DateTime.now(),
      totalPrice: rawOrder.totalPrice,
      status: rawOrder.status.name,
      createdAt: DateTime.tryParse(rawOrder.createdAt) ?? DateTime.now(),
      services: ServicesMapper.orderServicesToServicesDto(rawOrder.services!)
    );
  }

  static RefreshiOrderDto createOrderToOrderDto(Mutation$CreateOrder$createOrder rawOrder) {
    return RefreshiOrderDto(
      id: rawOrder.id,
      idempotencyKey: rawOrder.idempotencyKey,
      scheduledTime: DateTime.tryParse(rawOrder.scheduledTime) ?? DateTime.now(),
      totalPrice: rawOrder.totalPrice,
      status: rawOrder.status.name,
      createdAt: DateTime.tryParse(rawOrder.createdAt) ?? DateTime.now(),
      services: ServicesMapper.createOrderServicesToServicesDto(rawOrder.services!)
    );
  }
}
