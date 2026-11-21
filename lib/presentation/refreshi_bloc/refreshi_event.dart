part of 'refreshi_bloc.dart';

@freezed
abstract class RefreshiEvent with _$RefreshiEvent {
  const factory RefreshiEvent.getRefreshiServices() = GetRefreshiServices;
  const factory RefreshiEvent.getRefreshiOrder(String id) = GetRefreshiOrder;
  const factory RefreshiEvent.addServiceToOrderList(String id) =
      AddServiceToOrderList;
  const factory RefreshiEvent.selectScheduleTime(String scheduledTime) =
      SelectScheduleTime;
  // Order inputs come from the checkout draft held in state, so a repeated
  // dispatch always carries the same idempotency key.
  const factory RefreshiEvent.createRefreshiOrder() = CreateRefreshiOrder;
  const factory RefreshiEvent.resetCheckout() = ResetCheckout;
}
