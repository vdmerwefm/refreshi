part of 'refreshi_bloc.dart';

@freezed
sealed class RefreshiState with _$RefreshiState {
  const factory RefreshiState({
    RefreshiFailure? failure,
    @Default(false) bool isLoading,
    List<RefreshiServiceDto>? refreshiServices,
    List<String>? selectedServices,
    RefreshiOrderDto? refreshiOrder,
    @Default(false) isEnabled,
    String? status,
  }) = _RefreshiState;

  factory RefreshiState.fromJson(Map<String, dynamic> json) =>
      _$RefreshiStateFromJson(json);

  factory RefreshiState.empty() => const RefreshiState();
}
