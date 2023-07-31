import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import 'buttons/icon_button.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.textCtrl,
     required this.child,
    required this.onPressed,
  });

  final TextEditingController? textCtrl;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 280.0.w,
            height: 45.0.h,
            decoration: BoxDecoration(
                color: RGBColorManager.rgbWhiteColor,
                borderRadius: BorderRadius.circular(20.w)),
            child: Row(
              children: [
                IcnButton(
                    onPressed: onPressed,
                    iconSize: 0,
                    child: SizedBox(
                      height: 25,
                      child: Image.asset(
                        IconsAssets.searchLogo,
                      ),
                    )),
                Expanded(
                  child: TextFormField(
                    controller: textCtrl,
                    cursorHeight: 24,
                    cursorRadius: const Radius.circular(10).w,
                    cursorColor: ColorManager.blackColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 11).r,
                      hintText: "Search",
                      // border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
          child
        ],
      ),
    );
  }
}