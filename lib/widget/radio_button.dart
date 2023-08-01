import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';
import '../provider/provider.dart';

// this is the Custom radio button , design as per theme of the prject
class CustoumRadioButton extends StatelessWidget {
  const CustoumRadioButton({
    super.key,
    required this.label,
    required this.index,
    required this.width,
  });

  final String label;
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeColor>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            if (value.data.contains(index)) {
              value.remove(index);
            } else {
              value.data.clear();
              value.add(index);
            }
          },
          child: Container(
            width: width.w,
            margin: const EdgeInsets.only(right: 14).r,
            decoration: BoxDecoration(
                border: Border.all(
                    color: value.data.contains(index) ? ColorManager.blackColor : ColorManager.greyColor, width: 2),
                color: value.data.contains(index) ? ColorManager.blackColor : ColorManager.whiteColor,
                borderRadius: BorderRadius.all(const Radius.circular(9).w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 13.h,
                  child: value.data.contains(index)
                      ? Image.asset(
                          IconsAssets.radioEnabledLogo,
                        )
                      : Image.asset(IconsAssets.radioDisabledLogo),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: value.data.contains(index) ? ColorManager.whiteColor : ColorManager.greyColor,
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
