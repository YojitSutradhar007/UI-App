import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/router/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../resources/color_manager.dart';
import '../resources/string_manager.dart';
import '../user_preferences/user_preferences.dart';
import '../widget/reuse_widget.dart';

class FirebaseAuthServices {
  final db = FirebaseFirestore.instance;
  final bar = WarningBar();
  final userPreferences = UserPreferences();

  void forgetPassword(BuildContext context, TextEditingController forgetPassword) async {
    final successFull = bar.snack(StringManager.emailSent, ColorManager.greenColor);
    final invalid = bar.snack(StringManager.error, ColorManager.redColor);
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: Loading());
      },
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forgetPassword.text.trim());
      debugPrint(forgetPassword.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(successFull);
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(invalid);
      debugPrint("Failed to forget password");
    }
  }

  void signUP(BuildContext context, TextEditingController textEmailCtrl, TextEditingController textPassCtrl,
      TextEditingController textUserNameCtrl) async {
    final notExist = bar.snack(StringManager.yesAccount, ColorManager.redColor);
    debugPrint("Button pressed");
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: Loading(),
        );
      },
    );
    final userData = <String, String>{
      "UserName": textUserNameCtrl.text.trim(),
      "Email": textEmailCtrl.text.trim(),
      // "Password": textPassCtrl.text.trim()
    };
    try {
      await db.collection("Users").doc(textEmailCtrl.text.trim()).get().then(
        (value) {
          if (value.exists) {
            debugPrint(value["Email"]);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(notExist);
          } else {
            debugPrint("No email");
            db.collection("Users").doc(textEmailCtrl.text.toString().trim()).set(userData).then(
              (value) async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: textEmailCtrl.text.trim(), password: textPassCtrl.text.trim());
                // ignore: use_build_context_synchronously
                context.go(RoutesName.homeScreen);
                userPreferences.saveLoginUserInfo(textEmailCtrl.text.trim(), textPassCtrl.text.trim());

              },
            );
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("Failed to sign up${e.message}");
    }
  }

  Future signIN(BuildContext context, String textEmail, String textPass) async {
    debugPrint("Button pressed");
    final invalidCredentials = bar.snack(StringManager.invalidCredentials, ColorManager.redColor);
    final notExist = bar.snack(StringManager.noAccount, ColorManager.redColor);

    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: Loading());
        });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: textEmail, password: textPass)
          .then(
        (value)  {
          context.go(RoutesName.homeScreen);
           userPreferences.saveLoginUserInfo(textEmail, textPass);
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(notExist);
    }
  }
}
