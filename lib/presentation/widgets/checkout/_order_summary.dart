part of '../../pages/checkout_page.dart';

class _OrderSummary extends StatelessWidget {
  const _OrderSummary();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isLoggedIn = context.select((AuthBloc bloc) => bloc.state.isLoggedIn);
    return BlocBuilder<RefreshiBloc, RefreshiState>(
      builder: (context, state) {
        final selectedIds = state.selectedServices ?? const <String>[];
        final services =
            (state.refreshiServices ?? const <RefreshiServiceDto>[])
                .where((s) => selectedIds.contains(s.id))
                .toList();
        final total = state.orderTotal;

        final slot = state.scheduledTime == null
            ? null
            : DateTime.parse(state.scheduledTime!);

        final canConfirm =
            services.isNotEmpty && slot != null && !state.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 4, bottom: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF4FBF8),
                border: Border.all(width: 2),
                boxShadow: const [BoxShadow(offset: Offset(4, 4))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Order summary', style: textTheme.titleLarge),
                    const Divider(height: 24),
                    if (services.isEmpty)
                      const Text('No services selected yet.')
                    else
                      for (final s in services)
                        _SummaryRow(
                          label: s.name,
                          value: RefreshiFormatters.price(s.price),
                        ),
                    const SizedBox(height: 8),
                    _SummaryRow(
                      label: 'When',
                      value: slot == null
                          ? 'Pick a time'
                          : RefreshiFormatters.dateTime(slot),
                    ),
                    const _SummaryRow(
                      label: 'Payment',
                      value: refreshiSavedCardLabel,
                    ),
                    const Divider(height: 24),
                    _SummaryRow(
                      label: 'Total',
                      value: RefreshiFormatters.price(total),
                      emphasize: true,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A temporary hold for the total is placed on your card. '
                      'You are not charged until the service is completed.',
                      style: textTheme.bodySmall,
                    ),
                    if (state.failure != null &&
                        state.refreshiServices != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        state.failure!.message,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    RefreshiButton(
                      key: const Key('checkout.confirm'),
                      label:
                          'Confirm and hold ${RefreshiFormatters.price(total)}',
                      isLoading: state.isLoading,
                      onTap: canConfirm
                          ? () {
                              if (!context.read<AuthBloc>().state.isLoggedIn) {
                                context.go(
                                  RefreshiRoutes.signInFrom(
                                    RefreshiRoutes.checkout,
                                  ),
                                );
                                return;
                              }
                              context.read<RefreshiBloc>().add(
                                const RefreshiEvent.createRefreshiOrder(),
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            //web keeps sign out in the app bar
            if (!kIsWeb && isLoggedIn) ...[
              const SizedBox(height: 16),
              RefreshiButton(
                key: const Key('checkout.signOut'),
                label: 'Sign out',
                secondary: true,
                onTap: () {
                  Scrollable.maybeOf(context)?.position.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                  context.read<AuthBloc>().add(const AuthEvent.mockLogout());
                  context.read<RefreshiBloc>().add(
                    const RefreshiEvent.resetCheckout(),
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
