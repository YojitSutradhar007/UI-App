import 'package:flutter/material.dart';
import '../../../resources/import_resources.dart';
import '../../../resources/resources.dart';

// This is reuse widget backButton ,that we are using in whole project
class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key, this.topPadding}) : super(key: key);

  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topPadding ?? 0,
      ).r,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Image.asset(IconsAssets.backButtonLogo),
      ),
    );
  }
}
