import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../provider/toggle_provider.dart';

// this are the Switch Button or toggle button
// ignore: must_be_immutable
class SwitchButton extends StatelessWidget {
    SwitchButton({
    super.key,
    required this.changed,
    this.perform,
  });

  bool changed;
  final VoidCallback? perform;

  @override
  Widget build(BuildContext context) {
    return Consumer<Toggle>(
      builder: (context, values, child) {
        return Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            activeColor: ColorManager.blackColor,
            thumbColor: ColorManager.whiteColor,
            trackColor: Colors.black12,
            value: changed,
            onChanged: (value) {
              changed = values.onchange(value, changed);
              if (changed) {
                debugPrint("onchange True");
                perform!();
              } else {
                // DarkTheme.themeDarkFalse();
                debugPrint("button pressed onchange False");
              }
            },
          ),
        );
      },
    );
  }
}
