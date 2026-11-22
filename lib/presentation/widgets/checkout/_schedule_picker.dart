part of '../../pages/checkout_page.dart';

class _SchedulePicker extends StatelessWidget {
  const _SchedulePicker();

  @override
  Widget build(BuildContext context) {
    final selected = context.select(
      (RefreshiBloc bloc) => bloc.state.scheduledTime,
    );
    final slots = context.select(
      (RefreshiBloc bloc) => bloc.state.scheduleSlots,
    );
    final days = RefreshiScheduleHelper.slotsByDay(slots);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in days.entries) ...[
          Text(
            RefreshiFormatters.day(entry.key),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final slot in entry.value)
                _TimeSlotBox(
                  label: RefreshiFormatters.shortTime(slot),
                  selected: selected == slot.toIso8601String(),
                  onTap: () => context.read<RefreshiBloc>().add(
                    RefreshiEvent.selectScheduleTime(slot.toIso8601String()),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
