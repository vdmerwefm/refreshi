part of 'refreshi_bloc.dart';

@freezed
abstract class RefreshiEvent with _$RefreshiEvent {
  const factory RefreshiEvent.getRefreshiServices() = GetRefreshiServices;
  const factory RefreshiEvent.getRefreshiOrder(String id) = GetRefreshiOrder;
  const factory RefreshiEvent.addServiceToOrderList(String id) =
      AddServiceToOrderList;
  const factory RefreshiEvent.createRefreshiOrder(
    String idempotencyKey,
    List<String> serviceIds,
    String cardToken,
    String scheduledTime,
  ) = CreateRefreshiOrder;
}
