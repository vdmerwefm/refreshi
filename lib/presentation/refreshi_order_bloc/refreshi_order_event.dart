part of 'refreshi_order_bloc.dart';

@freezed
abstract class RefreshiOrderEvent with _$RefreshiOrderEvent {
  const factory RefreshiOrderEvent.getRefreshiOrder(String id) =
      GetRefreshiOrder;
}
