import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';

class DesignText extends StatelessWidget {
  const DesignText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.padding,
  });

  final String text;
  final double fontSize;
  final Color color;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 0).r,
      child: Text(
        text,
        style: fontWeightSizeColorTextStyle(FontWeightManager.bold, fontSize, color),
      ),
    );
  }
}
