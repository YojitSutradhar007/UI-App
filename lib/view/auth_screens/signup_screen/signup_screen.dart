import 'package:flutter/material.dart';
import '../../../resources/import_resources.dart';
import '../../../resources/resources.dart';
import '../../../services/auth_services.dart';
import '../../../widget/reuse_widget.dart';
import '../../../provider/signup_validation.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textUserNameCtrl = TextEditingController();

  final TextEditingController _textEmailCtrl = TextEditingController();

  final TextEditingController _textPassCtrl = TextEditingController();

  final signup = FirebaseAuthServices();

  void signUp(BuildContext context) {
    final signIn = Provider.of<SignUpValidation>(context, listen: false);
    if (signIn.checkEmail && signIn.checkPass) {
      signup.signUP(context, _textEmailCtrl, _textPassCtrl, _textUserNameCtrl);
    } else {
      debugPrint("not sign in ");
    }
  }

  @override
  Widget build(BuildContext context) {
    final validate = Provider.of<SignUpValidation>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconButton(
                  topPadding: 15,
                ),
                const CompanyDesign(),
                DesignText(text: StringManager.userName, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(
                  topMargin: 5,
                  onChanged: validate.userNameSignUpValidate,
                  textCtrl: _textUserNameCtrl,
                  hintText: StringManager.enterUserName,
                  enabledInputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(color: ColorManager.greyColor),
                  ),
                ),
                Consumer<SignUpValidation>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpUserNameValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ),
                    );
                  },
                ),
                DesignText(text: StringManager.enterEmail, fontSize: 12, color: ColorManager.blackColor, padding: 0),
                NormalTextField(
                  topMargin: 5,
                  onChanged: validate.emailSignUpValidate,
                  textCtrl: _textEmailCtrl,
                  hintText: StringManager.enterEmail,
                  enabledInputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(color: ColorManager.greyColor),
                  ),
                ),
                Consumer<SignUpValidation>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpEmailValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ),
                    );
                  },
                ),
                PassField(
                    onChanged: validate.passSignUpValidate,
                    textPassCtrl: _textPassCtrl,
                    hintText: StringManager.enterPassword,
                    labelText: StringManager.password),
                Consumer<SignUpValidation>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        value.signUpPassValidation,
                        style: TextStyle(color: ColorManager.redColor),
                      ),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ).r,
                  child: PrimaryButton(
                    backgroundColor: RGBColorManager.rgbNeonColor,
                    onPressed: () {
                      signUp(context);
                    },
                    child: Text(
                      StringManager.signUp,
                      style: fontSizeColorTextStyle(17, ColorManager.blackColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
