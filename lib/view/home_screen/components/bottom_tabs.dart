import 'package:ecommerce/provider/bottum_navigation.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';

// This are the buttons on button tab bar button with changing index abd body

class BottomTabButton extends StatelessWidget {
  const BottomTabButton(
      {super.key, required this.inDex, required this.onSelectImageAsset, required this.notSelectImageAsset});

  final int inDex;
  final String onSelectImageAsset;
  final String notSelectImageAsset;

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<BottumNavigation>(context, listen: false);
    return Consumer<BottumNavigation>(
      builder: (context, value, child) {
        return IconButton(
          enableFeedback: false,
          onPressed: () {
            if (navigation.contain.contains(inDex)) {
              debugPrint("change");
              navigation.change(inDex);
            } else {
              debugPrint("else change");
              navigation.contain.clear();
              navigation.change(inDex);
              navigation.add(inDex);
            }
          },
          icon: navigation.contain.contains(inDex)
              ? SizedBox(
            height: 30,
            child: Image.asset(
              onSelectImageAsset,
            ),
          )
              : SizedBox(
            height: 25,
            child: Image.asset(
              notSelectImageAsset,
            ),
          ),
        );
      },
    );
  }
}
