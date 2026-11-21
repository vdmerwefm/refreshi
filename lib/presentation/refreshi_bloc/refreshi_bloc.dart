import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
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

const refreshiHoldPendingStatus = 'CAPTURED';
const refreshiHoldPlacedStatus = 'HOLD_PLACED';
const refreshiSavedCardToken = 'tok_saved_visa_4242';
const refreshiSavedCardLabel = 'Visa •••• 4242';
const refreshiMaxServices = 2;

@injectable
class RefreshiBloc extends HydratedBloc<RefreshiEvent, RefreshiState> {
  RefreshiBloc(this._useCase) : super(RefreshiState.empty()) {
    on<GetRefreshiServices>((event, emit) async {
      emit(state.copyWith(isLoading: true, failure: null));

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
      // Only the most recently requested order is polled. If the user opens
      // another order, the loop below for the previous one stops by itself.
      _polledOrderId = event.id;
      bool isCurrent() => !emit.isDone && _polledOrderId == event.id;

      emit(
        state.copyWith(
          isLoading: true,
          failure: null,
          refreshiOrder: state.refreshiOrder?.id == event.id
              ? state.refreshiOrder
              : null,
        ),
      );

      // Payment confirmation arrives after the order is created, so keep
      // fetching while the hold is pending.
      while (isCurrent()) {
        final response = await _useCase.refreshiGetOrderUseCase(event.id);
        if (!isCurrent()) return;

        final keepPolling = response.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, failure: failure));
            return false;
          },
          (order) {
            emit(
              state.copyWith(
                isLoading: false,
                refreshiOrder: order,
                status: order.status,
              ),
            );
            return order.status == refreshiHoldPendingStatus;
          },
        );
        if (!keepPolling) return;
        await Future<void>.delayed(pollInterval);
      }
    });

    on<AddServiceToOrderList>((event, emit) {
      final serviceList = [...?state.selectedServices];

      if (serviceList.contains(event.id)) {
        serviceList.remove(event.id);
      } else if (serviceList.length < refreshiMaxServices) {
        serviceList.add(event.id);
      }

      emit(
        state.copyWith(
          selectedServices: serviceList,
          idempotencyKey: _newKey(),
          createdOrderId: null,
          failure: null,
        ),
      );
    });

    on<SelectScheduleTime>((event, emit) {
      emit(
        state.copyWith(
          scheduledTime: event.scheduledTime,
          idempotencyKey: _newKey(),
          createdOrderId: null,
          failure: null,
        ),
      );
    });

    // droppable: while a submission is in flight, further confirm events
    // (double click, Enter key spam) are ignored rather than queued.
    on<CreateRefreshiOrder>((event, emit) async {
      final selected = state.selectedServices ?? [];
      final scheduledTime = state.scheduledTime;
      if (state.isLoading || selected.isEmpty || scheduledTime == null) return;

      // Reuse the draft's key. It survives a browser refresh (hydrated), so a
      // retry after refresh resolves to the same order on the data source.
      final idempotencyKey = state.idempotencyKey ?? _newKey();
      emit(
        state.copyWith(
          isLoading: true,
          failure: null,
          idempotencyKey: idempotencyKey,
        ),
      );

      final response = await _useCase.refreshiCreateOrderUseCase(
        idempotencyKey,
        selected,
        refreshiSavedCardToken,
        scheduledTime,
      );

      response.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, failure: failure));
        },
        (createOrder) {
          emit(
            state.copyWith(
              isLoading: false,
              status: createOrder.status,
              refreshiOrder: createOrder,
              createdOrderId: createOrder.id,
            ),
          );
        },
      );
    }, transformer: droppable());

    // Called once the user has landed on the order page: the draft is done,
    // so the next checkout starts clean with a fresh key.
    on<ResetCheckout>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          failure: null,
          selectedServices: null,
          scheduledTime: null,
          idempotencyKey: null,
          createdOrderId: null,
        ),
      );
    });
  }

  final RefreshiUseCases _useCase;

  /// The order currently being polled on the details page.
  String? _polledOrderId;

  static const pollInterval = Duration(seconds: 1);

  static String _newKey() => const Uuid().v4();

  // Only the checkout draft is persisted; services and orders are always
  // re-fetched from the (GraphQL) source of truth.
  @override
  RefreshiState? fromJson(Map<String, dynamic> json) =>
      RefreshiState.empty().copyWith(
        selectedServices: (json['selectedServices'] as List<dynamic>?)
            ?.cast<String>(),
        scheduledTime: json['scheduledTime'] as String?,
        idempotencyKey: json['idempotencyKey'] as String?,
      );

  @override
  Map<String, dynamic>? toJson(RefreshiState state) => {
    'selectedServices': state.selectedServices,
    'scheduledTime': state.scheduledTime,
    'idempotencyKey': state.idempotencyKey,
  };
}
