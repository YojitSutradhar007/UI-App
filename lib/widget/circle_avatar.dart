import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';

class CrcleAvatar extends StatelessWidget {
  const CrcleAvatar({
    super.key,
    required this.radius,
    required this.color,
    required this.child,
  });

  final double radius;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Container(
        padding: const EdgeInsets.all(7).w,
        child: child,
      ),
    );
  }
}