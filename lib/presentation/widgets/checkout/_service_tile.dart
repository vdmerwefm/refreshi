part of '../../pages/checkout_page.dart';

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.service,
    required this.selected,
    required this.enabled,
  });

  final RefreshiServiceDto service;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 6),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0F766E) : Color(0xFFF4FBF8),
        border: Border.all(width: 2),
        boxShadow: const [BoxShadow(offset: Offset(4, 4))],
      ),

      child: GestureDetector(
        key: Key('service.${service.id}'),
        onTap: enabled
            ? () => context.read<RefreshiBloc>().add(
                RefreshiEvent.addServiceToOrderList(service.id),
              )
            : null,
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            enabled: enabled,
            textColor: textColor,
            title: Text(service.name),
            subtitle: Text(
              '${service.description}\n${service.durationMinutes} min',
            ),
            isThreeLine: true,
            trailing: Text(
              RefreshiFormatters.price(service.price),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: enabled ? textColor : Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
