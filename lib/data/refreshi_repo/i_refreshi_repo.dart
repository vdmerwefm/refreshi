import 'package:fpdart/fpdart.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/data/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/data/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';

abstract interface class IRefreshiRepo {
  TaskEither<RefreshiFailure, List<RefreshiServiceDto>> getServices();
  TaskEither<RefreshiFailure, RefreshiOrderDto> getOrder({required String id});
  TaskEither<RefreshiFailure, RefreshiOrderDto> createOrder({
    required String idempotencyKey,
    required List<String> serviceIds,
    required String cardToken,
    required String scheduledTime,
  });
}
