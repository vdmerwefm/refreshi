import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi/core/constants/refreshi_constants.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/di/injection.dart';
import 'package:refreshi/domain/refreshi_repo/i_repo/i_refreshi_repo.dart';
import 'package:refreshi/presentation/refreshi_order_bloc/refreshi_order_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  tearDown(refreshiSl.reset);

  test('shows the hold as pending, then placed once it confirms', () async {
    final created = await refreshiSl<IRefreshiRepo>()
        .createOrder(
          idempotencyKey: 'order-bloc-test',
          serviceIds: ['001'],
          cardToken: refreshiSavedCardToken,
          scheduledTime: DateTime(2030, 1, 1, 9).toIso8601String(),
        )
        .run();
    final orderId = created.getOrElse((failure) => fail(failure.message)).id;

    final bloc = RefreshiOrderBloc(refreshiSl())
      ..add(RefreshiOrderEvent.getRefreshiOrder(orderId));

    final pending = await bloc.stream.firstWhere(
      (s) => s.refreshiOrder != null,
    );
    expect(pending.refreshiOrder!.status, refreshiHoldPendingStatus);

    //data source confirms after 3 seconds, the bloc keeps polling until then
    final placed = await bloc.stream
        .firstWhere((s) => s.refreshiOrder?.status == refreshiHoldPlacedStatus)
        .timeout(const Duration(seconds: 10));
    expect(placed.refreshiOrder!.holdConfirmedAt, isNotNull);

    await bloc.close();
  });

  test('unknown order id fails with OrderNotFoundException', () async {
    final bloc = RefreshiOrderBloc(refreshiSl())
      ..add(const RefreshiOrderEvent.getRefreshiOrder('missing'));

    final state = await bloc.stream.firstWhere((s) => !s.isLoading);
    expect(state.failure, isA<OrderNotFoundException>());

    await bloc.close();
  });
}
