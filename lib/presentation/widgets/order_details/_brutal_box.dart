part of '../../pages/order_details_page.dart';

//same box as the checkout tiles
class _BrutalBox extends StatelessWidget {
  const _BrutalBox({
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(20),
    this.shadowOffset = const Offset(4, 4),
    super.key,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 4),
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFF4FBF8),
        border: Border.all(width: 2),
        boxShadow: [BoxShadow(offset: shadowOffset)],
      ),
      child: child,
    );
  }
}
