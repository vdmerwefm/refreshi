part of '../../pages/order_details_page.dart';

class _OrderDetails extends StatelessWidget {
  const _OrderDetails({required this.order});

  final RefreshiOrderDto order;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final holdPlaced = order.status == refreshiHoldPlacedStatus;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: RefreshiPageBody(
        maxWidth: 720,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order details', style: textTheme.headlineSmall),
                _BrutalBox(
                  key: const Key('order.status'),
                  color: holdPlaced ? const Color(0xFF0F766E) : null,
                  shadowOffset: holdPlaced
                      ? const Offset(2, 2)
                      : const Offset(4, 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        holdPlaced ? Icons.check_circle : Icons.schedule,
                        size: 18,
                        color: holdPlaced ? Colors.white : Colors.black,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        holdPlaced ? 'Hold placed' : 'Hold pending',
                        style: TextStyle(
                          color: holdPlaced ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SelectableText(
                order.id,
                style: textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Text('Status', style: textTheme.titleMedium),
            const SizedBox(height: 12),
            _StatusTile(
              title: 'Order created',
              subtitle: RefreshiFormatters.time(order.createdAt),
              done: true,
            ),
            const SizedBox(height: 8),
            _StatusTile(
              title: 'Hold placed',
              subtitle: holdPlaced && order.holdConfirmedAt != null
                  ? RefreshiFormatters.time(order.holdConfirmedAt!)
                  : 'Waiting for card issuer to confirm…',
              done: holdPlaced,
            ),
            const SizedBox(height: 12),
            _BrutalBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Summary', style: textTheme.titleMedium),
                  const SizedBox(height: 8),
                  for (final service in order.services)
                    _Row(service.name, RefreshiFormatters.price(service.price)),
                  _Row(
                    'When',
                    RefreshiFormatters.dateTime(order.scheduledTime),
                  ),
                  const _Row('Payment', refreshiSavedCardLabel),
                  const Divider(height: 24),
                  _Row(
                    holdPlaced ? 'Held on card' : 'Hold requested',
                    RefreshiFormatters.price(order.totalPrice),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: RefreshiButton(
                label: 'Book another service',
                onTap: () => context.go(RefreshiRoutes.checkout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
