import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../../../widget/reuse_widget.dart';

class Forget extends StatelessWidget {
  Forget({Key? key}) : super(key: key);

  final TextEditingController _textForgetPassCtrl = TextEditingController();
  final forget = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIconButton(topPadding: 30),
            const CompanyDesign(),
            DesignText(text: StringManager.email, fontSize: 12, color: ColorManager.blackColor, padding: 0),
            NormalTextField(
              topMargin: 5,
              enabledInputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:   BorderSide(color: ColorManager.greyColor),
              ),
              textCtrl: _textForgetPassCtrl,
              hintText: StringManager.enterEmail,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 45,
              ).r,
              child: PrimaryButton(
                backgroundColor: RGBColorManager.rgbNeonColor,
                onPressed: () {
                  forget.forgetPassword(context, _textForgetPassCtrl);
                },
                child:Text(
                  StringManager.forgetPassword,
                  style: fontSizeColorTextStyle(17, ColorManager.blackColor),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
