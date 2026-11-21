import 'package:flutter_test/flutter_test.dart';
import 'package:refreshi/data/i_refreshi_repo/i_refreshi_repo.dart';
import 'package:refreshi/di/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lists services, creates an order, and retrieves it', () async {
    SharedPreferences.setMockInitialValues({});
    addTearDown(refreshiSl.reset);
    await configureDependencies();
    final repository = refreshiSl<IRefreshiRepo>();

    final servicesResult = await repository.getServices().run();
    final services = servicesResult.match(
      (failure) => fail('getServices failed: ${failure.message}'),
      (services) => services,
    );

    expect(services, hasLength(3));

    final selectedServices = services.take(2).toList();
    final scheduledTime = DateTime.utc(2026, 12, 1, 10);
    final createResult = await repository
        .createOrder(
          idempotencyKey: 'repo-test-idempotency-key',
          serviceIds: selectedServices.map((service) => service.id).toList(),
          cardToken: 'test-card-token',
          scheduledTime: scheduledTime.toIso8601String(),
        )
        .run();

    final createdOrder = createResult.match(
      (failure) => fail('createOrder failed: ${failure.message}'),
      (order) => order,
    );

    expect(createdOrder.id, isNotEmpty);
    expect(createdOrder.idempotencyKey, 'repo-test-idempotency-key');
    expect(createdOrder.scheduledTime, scheduledTime);
    expect(createdOrder.services, selectedServices);
    expect(createdOrder.totalPrice, 380);

    final getResult = await repository.getOrder(id: createdOrder.id).run();
    final fetchedOrder = getResult.match(
      (failure) => fail('getOrder failed: ${failure.message}'),
      (order) => order,
    );

    expect(fetchedOrder, createdOrder);
  });
}
