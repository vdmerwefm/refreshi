part of '../../pages/sign_in_page.dart';

class _BrutalField extends StatelessWidget {
  const _BrutalField({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF4FBF8),
        border: Border.all(width: 2),
        boxShadow: const [BoxShadow(offset: Offset(4, 4))],
      ),
      child: child,
    );
  }
}
