import 'package:flutter/material.dart';

//shared button, null onTap greys it out, secondary is the light version
class RefreshiButton extends StatelessWidget {
  const RefreshiButton({
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.secondary = false,
    super.key,
  });

  final String label;

  final VoidCallback? onTap;

  final bool isLoading;

  final bool secondary;

  static const _primary = Color(0xFF0F766E);
  static const _light = Color(0xFFF4FBF8);
  static const _disabled = Color(0xFFBDBDBD);

  @override
  Widget build(BuildContext context) {
    final Color background;
    if (secondary) {
      background = _light;
    } else if (onTap != null || isLoading) {
      background = _primary;
    } else {
      background = _disabled;
    }
    final foreground = secondary ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(width: 2),
          boxShadow: const [BoxShadow(offset: Offset(4, 4))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foreground,
                ),
              )
            else
              Text(
                label,
                style: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
