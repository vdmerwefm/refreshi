import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';
import 'package:refreshi/domain/refreshi_repo/refreshi_repo.dart';

@Injectable()
class RefreshiUseCases {
  const RefreshiUseCases(this._repo);

  Future<Either<RefreshiFailure, List<RefreshiServiceDto>>>
  refreshiGetServicesUseCase() async {
    return _repo.getServices().run();
  }

  Future<Either<RefreshiFailure, RefreshiOrderDto>> refreshiGetOrderUseCase(
    String id,
  ) {
    return _repo.getOrder(id: id).run();
  }

  Future<Either<RefreshiFailure, RefreshiOrderDto>> refreshiCreateOrderUseCase(
    String idempotencyKey,
    List<String> serviceIds,
    String cardToken,
    String scheduledTime,
  ) {
    return _repo
        .createOrder(
          idempotencyKey: idempotencyKey,
          serviceIds: serviceIds,
          cardToken: cardToken,
          scheduledTime: scheduledTime,
        )
        .run();
  }

  final RefreshiRepo _repo;
}
