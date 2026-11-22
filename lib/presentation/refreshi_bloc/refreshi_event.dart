part of 'refreshi_bloc.dart';

@freezed
abstract class RefreshiEvent with _$RefreshiEvent {
  const factory RefreshiEvent.getRefreshiServices() = GetRefreshiServices;
  const factory RefreshiEvent.getScheduleSlots() = GetScheduleSlots;
  const factory RefreshiEvent.getRefreshiOrder(String id) = GetRefreshiOrder;
  const factory RefreshiEvent.addServiceToOrderList(String id) =
      AddServiceToOrderList;
  const factory RefreshiEvent.selectScheduleTime(String scheduledTime) =
      SelectScheduleTime;
  const factory RefreshiEvent.createRefreshiOrder() = CreateRefreshiOrder;
  const factory RefreshiEvent.resetCheckout() = ResetCheckout;
}
