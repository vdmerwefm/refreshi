import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';
import 'package:refreshi/domain/refreshi_use_cases/refreshi_use_cases.dart';
import 'package:refreshi/presentation/helpers/refreshi_schedule_helper.dart';
import 'package:uuid/uuid.dart';

part 'refreshi_event.dart';
part 'refreshi_state.dart';
part 'refreshi_bloc.freezed.dart';
part 'refreshi_bloc.g.dart';

//CAPTURED really means hold pending here, should be renamed in the schema
const refreshiHoldPendingStatus = 'CAPTURED';
const refreshiHoldPlacedStatus = 'HOLD_PLACED';
//saved card is hardcoded, the schema has no cards query yet
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
          emit(
            state.copyWith(
              isLoading: false,
              refreshiServices: services,
              //prices a selection restored after refresh
              orderTotal: _totalFor(services, state.selectedServices),
            ),
          );
        },
      );
    });

    on<GetRefreshiOrder>((event, emit) async {
      //only the latest order gets polled, older loops stop themselves
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

      //hold confirms after the order is created, would be a subscription with a real backend
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
          orderTotal: _totalFor(state.refreshiServices, serviceList),
          idempotencyKey: _newKey(),
          createdOrderId: null,
          failure: null,
        ),
      );
    });

    on<GetScheduleSlots>((event, emit) {
      final slots = RefreshiScheduleHelper.slots(DateTime.now());
      final stillBookable = RefreshiScheduleHelper.isBookable(
        state.scheduledTime,
        slots,
      );
      emit(
        state.copyWith(
          scheduleSlots: slots,
          scheduledTime: stillBookable ? state.scheduledTime : null,
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

    //droppable ignores repeat confirms while one is in flight
    on<CreateRefreshiOrder>((event, emit) async {
      final selected = state.selectedServices ?? [];
      final scheduledTime = state.scheduledTime;
      if (state.isLoading || selected.isEmpty || scheduledTime == null) return;

      //key is per cart not per click, survives a refresh so a retry gets the same order
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

    //fires after landing on the order page so the next checkout starts clean
    on<ResetCheckout>((event, emit) {
      emit(
        state.copyWith(
          isLoading: false,
          failure: null,
          selectedServices: null,
          orderTotal: 0,
          scheduledTime: null,
          idempotencyKey: null,
          createdOrderId: null,
        ),
      );
    });
  }

  final RefreshiUseCases _useCase;

  String? _polledOrderId;

  static const pollInterval = Duration(seconds: 1);

  static String _newKey() => const Uuid().v4();

  //prices are floats for the slice, should be int cents
  static double _totalFor(
    List<RefreshiServiceDto>? services,
    List<String>? selectedIds,
  ) {
    if (services == null || selectedIds == null) return 0;
    return services
        .where((service) => selectedIds.contains(service.id))
        .fold(0, (sum, service) => sum + service.price);
  }

  //only the draft is persisted, services and orders always come from gql
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
