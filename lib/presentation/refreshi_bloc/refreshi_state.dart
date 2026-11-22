part of 'refreshi_bloc.dart';

@freezed
sealed class RefreshiState with _$RefreshiState {
  const factory RefreshiState({
    RefreshiFailure? failure,
    @Default(false) bool isLoading,
    List<RefreshiServiceDto>? refreshiServices,
    List<String>? selectedServices,
    //display only, the order uses the total the data source calculates
    @Default(0) double orderTotal,
    RefreshiOrderDto? refreshiOrder,
    @Default(false) isEnabled,
    String? status,
    //scheduledTime is always one of these or null
    @Default(<DateTime>[]) List<DateTime> scheduleSlots,
    String? scheduledTime,
    String? idempotencyKey,
    String? createdOrderId,
  }) = _RefreshiState;

  factory RefreshiState.fromJson(Map<String, dynamic> json) =>
      _$RefreshiStateFromJson(json);

  factory RefreshiState.empty() => const RefreshiState();
}
