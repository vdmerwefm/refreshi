part of 'refreshi_order_bloc.dart';

@freezed
sealed class RefreshiOrderState with _$RefreshiOrderState {
  const factory RefreshiOrderState({
    RefreshiFailure? failure,
    @Default(false) bool isLoading,
    RefreshiOrderDto? refreshiOrder,
  }) = _RefreshiOrderState;

  factory RefreshiOrderState.empty() => const RefreshiOrderState();
}
