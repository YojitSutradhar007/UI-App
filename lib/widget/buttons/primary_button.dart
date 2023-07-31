import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../../resources/resources.dart';

// This are the different colour theme which we are using in whole project
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
    this.backgroundColor,
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 400.w, height ?? 50.h),
        backgroundColor: backgroundColor ?? ColorManager.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??20).w,
        ),
      ),
      child: child,
    );
  }
}


