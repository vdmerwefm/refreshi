part of '../../pages/checkout_page.dart';

class _ServiceList extends StatelessWidget {
  const _ServiceList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshiBloc, RefreshiState>(
      buildWhen: (previous, current) =>
          previous.refreshiServices != current.refreshiServices ||
          previous.selectedServices != current.selectedServices ||
          previous.failure != current.failure,
      builder: (context, state) {
        final services = state.refreshiServices;
        if (services == null) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final selected = state.selectedServices ?? const <String>[];
        final limitReached = selected.length >= refreshiMaxServices;
        return Column(
          children: [
            for (final service in services)
              _ServiceTile(
                service: service,
                selected: selected.contains(service.id),
                enabled: selected.contains(service.id) || !limitReached,
              ),
          ],
        );
      },
    );
  }
}
