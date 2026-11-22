import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/constants/refreshi_constants.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_use_cases/refreshi_use_cases.dart';

part 'refreshi_order_event.dart';
part 'refreshi_order_state.dart';
part 'refreshi_order_bloc.freezed.dart';

//one per order page, closing the page closes the bloc and stops the polling
@injectable
class RefreshiOrderBloc extends Bloc<RefreshiOrderEvent, RefreshiOrderState> {
  RefreshiOrderBloc(this._useCase) : super(RefreshiOrderState.empty()) {
    on<GetRefreshiOrder>((event, emit) async {
      emit(state.copyWith(isLoading: true, failure: null));

      //hold confirms after the order is created, would be a subscription with a real backend
      while (!emit.isDone) {
        final response = await _useCase.refreshiGetOrderUseCase(event.id);
        if (emit.isDone) return;

        final keepPolling = response.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, failure: failure));
            return false;
          },
          (order) {
            emit(state.copyWith(isLoading: false, refreshiOrder: order));
            return order.status == refreshiHoldPendingStatus;
          },
        );
        if (!keepPolling) return;
        await Future<void>.delayed(pollInterval);
      }
    });
  }

  final RefreshiUseCases _useCase;

  static const pollInterval = Duration(seconds: 1);
}
