import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

// This is custom box Widget which we use in user profile Screens

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15).w,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.greyOpacityColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

class BoxText extends StatelessWidget {
  const BoxText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: fontWeightSizeColorTextStyle(FontWeightManager.medium, 16, ColorManager.greyOpacityColor),
    );
  }
}

class DesignLabel extends StatelessWidget {
  const DesignLabel({
    super.key,
    required this.label_1,
    required this.sizeBoxWidth,
    this.onTap,
    required this.child,
  });

  final String label_1;
  final double sizeBoxWidth;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: sizeBoxWidth.w,
        child: Row(
          children: [
            child,
            Text(
              label_1,
              style: fontWeightSizeColorTextStyle(FontWeightManager.bold, 16, Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    required this.iconAsset,
  });
  final String iconAsset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 50.w,
      padding: const EdgeInsets.all(15).w,
      decoration: BoxDecoration(
        color: RGBColorManager.rgbWhiteColor,
        borderRadius: BorderRadius.circular(10).w,
      ),
      child: Image.asset(iconAsset),
    );
  }
}
