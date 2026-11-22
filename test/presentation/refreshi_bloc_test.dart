import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:refreshi/di/injection.dart';
import 'package:refreshi/presentation/refreshi_bloc/refreshi_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/in_memory_storage.dart';

/// Number of orders persisted by the local GraphQL data source.
Future<int> persistedOrderCount() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getKeys().map(prefs.getString).whereType<String>();
  return raw.isEmpty ? 0 : (jsonDecode(raw.single) as List).length;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    HydratedBloc.storage = InMemoryStorage();
    await configureDependencies();
  });

  tearDown(refreshiSl.reset);

  test(
    'double-clicking confirm and refreshing mid-submit place exactly one order',
    () async {
      final firstTab = refreshiSl<RefreshiBloc>()
        ..add(const RefreshiEvent.addServiceToOrderList('001'))
        ..add(
          RefreshiEvent.selectScheduleTime(
            DateTime(2030, 1, 1, 9).toIso8601String(),
          ),
        );
      await pumpEventQueue();

      // Rapid repeated clicks while the first request is in flight.
      firstTab
        ..add(const RefreshiEvent.createRefreshiOrder())
        ..add(const RefreshiEvent.createRefreshiOrder())
        ..add(const RefreshiEvent.createRefreshiOrder());
      await pumpEventQueue();

      final afterRefresh = refreshiSl<RefreshiBloc>();
      expect(afterRefresh.state.idempotencyKey, firstTab.state.idempotencyKey);
      afterRefresh.add(const RefreshiEvent.createRefreshiOrder());

      final firstId = (await firstTab.stream.firstWhere(
        (s) => s.createdOrderId != null,
      )).createdOrderId;
      final secondId = (await afterRefresh.stream.firstWhere(
        (s) => s.createdOrderId != null,
      )).createdOrderId;

      expect(secondId, firstId);
      expect(await persistedOrderCount(), 1);

      await firstTab.close();
      await afterRefresh.close();
    },
  );

  test('changing the cart starts a new purchase intent (new key)', () async {
    final bloc = refreshiSl<RefreshiBloc>()
      ..add(const RefreshiEvent.addServiceToOrderList('001'));
    await pumpEventQueue();
    final firstKey = bloc.state.idempotencyKey;

    bloc.add(const RefreshiEvent.addServiceToOrderList('002'));
    await pumpEventQueue();

    expect(bloc.state.selectedServices, ['001', '002']);
    expect(bloc.state.idempotencyKey, isNot(firstKey));

    bloc.add(const RefreshiEvent.addServiceToOrderList('003'));
    await pumpEventQueue();
    expect(bloc.state.selectedServices, ['001', '002']);

    await bloc.close();
  });
}
