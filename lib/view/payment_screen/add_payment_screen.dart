import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../widget/reuse_widget.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({Key? key}) : super(key: key);

  final TextEditingController _cardNumberCtrl = TextEditingController();
  final TextEditingController _expDateCtrl = TextEditingController();
  final TextEditingController _cvvCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconButton(),
                DesignText(text: "Payment", fontSize: 20, color: ColorManager.blackColor, padding: 0),
                Container(
                  width: double.infinity,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                          ProjectImage.cardLogo,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                DesignText(text: "Card details", fontSize: 18, color: ColorManager.blackColor, padding: 8),
                NormalTextField(
                    hintText: "Card details",
                    textCtrl: _cardNumberCtrl,
                    enabledInputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: ColorManager.greyColor),
                    ),
                    topMargin: 12),
                NormalTextField(
                    hintText: "Exp date",
                    textCtrl: _expDateCtrl,
                    enabledInputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: ColorManager.greyColor),
                    ),
                    topMargin: 12),
                NormalTextField(
                    hintText: "CVV",
                    textCtrl: _cvvCtrl,
                    enabledInputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: ColorManager.greyColor),
                    ),
                    topMargin: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 40).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint("Cancel");
                        },
                        child: DesignText(
                          text: "Cancel",
                          fontSize: 20,
                          color: ColorManager.grey400Color,
                        ),
                      ),
                      PrimaryButton(
                        borderRadius: 15,
                         width: 45,
                        onPressed: () {
                          debugPrint("Pressed");
                        },
                        child: DesignText(
                          text: "Confirm",
                          fontSize: 15,
                          color: ColorManager.whiteColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
