import 'package:flutter/material.dart';

// this reuse IconButton which are using in the whole project
class IcnButton extends StatelessWidget {
  const IcnButton({
    super.key,
    required this.onPressed,
     this.iconSize,
    required this.child,
  });

  final VoidCallback onPressed;
  final double? iconSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        iconSize: iconSize,
        onPressed: onPressed,
        icon: child
    );
  }
}