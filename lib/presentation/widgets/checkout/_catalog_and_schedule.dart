part of '../../pages/checkout_page.dart';

class _CatalogAndSchedule extends StatelessWidget {
  const _CatalogAndSchedule();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose services', style: textTheme.headlineSmall),
        const Text('Select one or two services.'),
        const SizedBox(height: 12),
        const _ServiceList(),
        const SizedBox(height: 12),
        Text('Pick a time', style: textTheme.headlineSmall),
        const SizedBox(height: 12),
        const _SchedulePicker(),
      ],
    );
  }
}
