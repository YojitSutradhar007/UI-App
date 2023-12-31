import 'package:ecommerce/router/route_name.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../../../widget/reuse_widget.dart';
import '../../../provider/singin_validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEmailCtrl = TextEditingController();

  final TextEditingController _textPassCtrl = TextEditingController();

  final signInMethod = FirebaseAuthServices();

  Future logIn(BuildContext context) async {
    final signIn = Provider.of<SignInValidation>(context, listen: false);
    if (signIn.checkEmail && signIn.checkPass) {
      await signInMethod.signIN(context, _textEmailCtrl.text.trim(), _textPassCtrl.text.trim());
    } else {
      debugPrint("not sign in ");
    }
  }

  @override
  Widget build(BuildContext context) {
    final validate = Provider.of<SignInValidation>(context, listen: false);
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 90).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CompanyDesign(),
                DesignText(text: StringManager.email, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(
                  keyboardType: TextInputType.emailAddress,
                  topMargin: 5,
                  onChanged: validate.emailSignInValidate,
                  textCtrl: _textEmailCtrl,
                  enabledInputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(color: ColorManager.greyColor),
                  ),
                  hintText: StringManager.enterEmail,
                ),
                Consumer<SignInValidation>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.emailValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ),
                    );
                  },
                ),
                PassField(
                    onChanged: validate.passSignInValidate,
                    textPassCtrl: _textPassCtrl,
                    hintText: StringManager.enterPassword,
                    labelText: StringManager.password),
                Consumer<SignInValidation>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.passValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    context.push(RoutesName.forgetScreen);
                  },
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ).r,
                  child: PrimaryButton(
                    backgroundColor: RGBColorManager.rgbNeonColor,
                    onPressed: () {
                      logIn(context);
                    },
                    child: Text(
                      StringManager.signIn,
                      style: fontSizeColorTextStyle(17, ColorManager.blackColor),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0).r,
                          child: Divider(
                            color: ColorManager.blackColor,
                            height: 45.h,
                          )),
                    ),
                    const Text("OR"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0).r,
                        child: Divider(
                          color: ColorManager.blackColor,
                          height: 45.h,
                        ),
                      ),
                    ),
                  ],
                ),
                const SignInOption(
                  label: StringManager.googleSignIn,
                  iconImage: IconsAssets.googleLogo,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const SignInOption(
                  label: StringManager.appleSignIn,
                  iconImage: IconsAssets.appleLogo,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10).r,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        context.push(RoutesName.signupScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              color: ColorManager.blackColor, fontSize: 13.sp, fontWeight: FontWeightManager.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    color: ColorManager.lightBlueColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeightManager.bold))
                          ],
                        ),
                      ),
                    ),
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
