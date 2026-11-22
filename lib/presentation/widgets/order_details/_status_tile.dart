part of '../../pages/order_details_page.dart';

//spinner while pending, goes green once done
class _StatusTile extends StatelessWidget {
  const _StatusTile({
    required this.title,
    required this.subtitle,
    required this.done,
  });

  final String title;
  final String subtitle;
  final bool done;

  @override
  Widget build(BuildContext context) {
    final textColor = done ? Colors.white : Colors.black;
    return _BrutalBox(
      color: done ? const Color(0xFF0F766E) : null,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: textColor),
                ),
                Text(subtitle, style: TextStyle(color: textColor)),
              ],
            ),
          ),
          if (!done)
            const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}
