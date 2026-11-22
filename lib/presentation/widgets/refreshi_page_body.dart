import 'package:flutter/material.dart';

//caps the width so pages dont stretch on wide browsers
class RefreshiPageBody extends StatelessWidget {
  const RefreshiPageBody({
    required this.child,
    this.maxWidth = 1100,
    super.key,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
