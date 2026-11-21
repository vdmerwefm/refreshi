import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';
import 'package:refreshi/domain/refreshi_use_cases/refreshi_use_cases.dart';
import 'package:uuid/uuid.dart';

part 'refreshi_event.dart';
part 'refreshi_state.dart';
part 'refreshi_bloc.freezed.dart';
part 'refreshi_bloc.g.dart';

@injectable
class RefreshiBloc extends Bloc<RefreshiEvent, RefreshiState> {
  RefreshiBloc(this._useCase) : super(RefreshiState.empty()) {
    on<GetRefreshiServices>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.refreshiGetServicesUseCase();

      response.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, failure: failure));
        },
        (services) {
          emit(state.copyWith(isLoading: false, refreshiServices: services));
        },
      );
    });
    on<GetRefreshiOrder>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.refreshiGetOrderUseCase(event.id);

      response.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, failure: failure));
        },
        (order) {
          emit(state.copyWith(isLoading: false, refreshiOrder: order));
        },
      );
    });
    on<AddServiceToOrderList>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final serviceList = <String>[];

      if(serviceList.contains(event.id)){
        serviceList.remove(event.id);
      } else if (serviceList.isEmpty || serviceList.length <= 3){
        serviceList.add(event.id);
      }

      emit(state.copyWith(isLoading: false, selectedServices: serviceList));
    });
    on<CreateRefreshiOrder>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.refreshiCreateOrderUseCase(
        const Uuid().v4(),
        state.selectedServices ?? [],
        'test-card-token',
        DateTime.now().toString(),
      );

      response.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, failure: failure));
        },
        (createOrder) {
          emit(state.copyWith(isLoading: false, status: createOrder.status));
        },
      );
    });
  }
  final RefreshiUseCases _useCase;
}
