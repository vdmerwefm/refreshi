import 'package:refreshi/data/graphql/refreshi_gql/operations.graphql.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';

class ServicesMapper {
  static List<RefreshiServiceDto> servicesToServicesDto(
    List<Query$GetServices$services> services,
  ) {
    return services
        .map(
          (service) => RefreshiServiceDto(
            id: service.id,
            name: service.name,
            description: service.description,
            price: service.price,
            durationMinutes: service.durationMinutes,
          ),
        )
        .toList();
  }

  static List<RefreshiServiceDto> orderServicesToServicesDto(
    List<Query$GetOrder$order$services> services,
  ) {
    return services
        .map(
          (service) => RefreshiServiceDto(
            id: service.id,
            name: service.name,
            description: service.description,
            price: service.price,
            durationMinutes: service.durationMinutes,
          ),
        )
        .toList();
  }

  static List<RefreshiServiceDto> createOrderServicesToServicesDto(
    List<Mutation$CreateOrder$createOrder$services> services,
  ) {
    return services
        .map(
          (service) => RefreshiServiceDto(
            id: service.id,
            name: service.name,
            description: service.description,
            price: service.price,
            durationMinutes: service.durationMinutes,
          ),
        )
        .toList();
  }
}
