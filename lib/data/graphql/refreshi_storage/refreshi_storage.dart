import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/data/graphql/refreshi_gql/operations.graphql.dart';
import 'package:refreshi/data/graphql/refreshi_gql/schema.graphql.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class RefreshiLocalStorage {
  RefreshiLocalStorage(this._sharedPreferences) {
    _loadFromRefreshiLocalStorage();
  }

  final SharedPreferences _sharedPreferences;
  static const _refreshiStorageKey = 'refreshi_order_slice_092120112026';

  final List<Query$GetServices$services> _getServicesList = [
    Query$GetServices$services(
      id: '001',
      name: 'The Usual',
      description: 'Hand wash and dry, interior vacuum',
      price: 180.00,
      durationMinutes: 120,
    ),
    Query$GetServices$services(
      id: '002',
      name: 'Extra Love',
      description: 'Type Shine, high definition wax, leather treatment',
      price: 200,
      durationMinutes: 30,
    ),
    Query$GetServices$services(
      id: '003',
      name: 'Gunkbuster',
      description: 'Interior deep clean of the roof, carpets and seats',
      price: 400,
      durationMinutes: 120,
    ),
  ];

  Map<String, Query$GetOrder$order> _ordersById = {};
  Map<String, String> _orderIdByIdempotencyKey = {};

  Future<void> _saveToRefreshiStorage() async {
    final _orderForStorage = _ordersById.values
        .map((order) => order.toJson())
        .toList();
    final _savedOrders = jsonEncode(_orderForStorage);
    await _sharedPreferences.setString(_refreshiStorageKey, _savedOrders);
  }

  void _loadFromRefreshiLocalStorage() {
    final storedOrderString = _sharedPreferences.getString(_refreshiStorageKey);

    if (storedOrderString == null) return;

    final storedOrderIterable = jsonDecode(storedOrderString) as List<dynamic>;
    for (final orderItem in storedOrderIterable) {
      final order = Query$GetOrder$order.fromJson(
        orderItem as Map<String, dynamic>,
      );
      _ordersById[order.id] = order;
      _orderIdByIdempotencyKey[order.idempotencyKey] = order.id;
    }
  }

  List<Query$GetServices$services> getServices() => _getServicesList;

  Query$GetOrder$order? getOrderById(String id) => _ordersById[id];

  Future<Query$GetOrder$order> createOrder(Input$CreateOrderInput input) async {
    final _existingId = _orderIdByIdempotencyKey[input.idempotencyKey];

    if (_existingId != null && _ordersById.containsKey(_existingId)) {
      return _ordersById[_existingId]!;
    }

    if (input.serviceIds != null) {
      if (input.serviceIds!.isEmpty || input.serviceIds!.length < 2) {
        throw ServiceValidationException();
      }
    }

    if (input.cardToken.trim().isEmpty) {
      throw InvalidCardException();
    }

    final _consolidateServices = _getServicesList.where(
      (service) => input.serviceIds!.contains(service.id),
    );
    final _getServices = _consolidateServices
        .map(
          (service) => Query$GetOrder$order$services(
            id: service.id,
            name: service.name,
            description: service.description,
            price: service.price,
            durationMinutes: service.durationMinutes,
          ),
        )
        .toSet()
        .toList();

    final _services = _getServices;
    final _totalPrice = _getServices.fold(0.0, (a, b) => a + b.price);
    final _orderId = '_order_${DateTime.now().toIso8601String()}';
    final _orderStatus = Enum$OrderStatus.CAPTURED;
    final _createdAt = DateTime.now().toIso8601String();

    final _order = Query$GetOrder$order(
      id: _orderId,
      services: _services,
      idempotencyKey: input.idempotencyKey,
      scheduledTime: input.scheduledTime,
      totalPrice: _totalPrice,
      status: _orderStatus,
      createdAt: _createdAt,
      holdConfirmedAt: '',
    );

    _ordersById[_orderId] = _order;
    _orderIdByIdempotencyKey[input.idempotencyKey] = _orderId;
    await _saveToRefreshiStorage();

    Future.delayed(Duration(seconds: 3), () async {
      final current = _ordersById[_orderId];

      if (current != null && current.status == Enum$OrderStatus.CAPTURED) {
        _ordersById[_orderId] = current.copyWith(
          status: Enum$OrderStatus.HOLD_PLACED,
          holdConfirmedAt: DateTime.now().toIso8601String(),
        );
        await _saveToRefreshiStorage();
      }
    });

    return _order;
  }
}
