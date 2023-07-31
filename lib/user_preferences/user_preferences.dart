import 'package:ecommerce/resources/import_resources.dart';
import 'package:flutter/material.dart';
import '../view/screens.dart';
import '../widget/reuse_widget.dart';

// In this we use sharedPreferences to save the user as data locally so user don't need to sign in again and again
class UserPreferences {
  String? email;
  String? pass;

  void logOutsetData(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: Loading());
      },
    );
    final SharedPreferences userData = await SharedPreferences.getInstance();
    userData.setString("Email", "");
    userData.setString("Password", "");
    Get.offAll(LoginScreen());
  }

  void getUserInfo() async {
    final SharedPreferences userData = await SharedPreferences.getInstance();
    email = userData.getString("Email");
    pass = userData.getString("Password");
    debugPrint("Email: ${email!}");
  }

  void saveLoginUserInfo(String userEmail, String userPassword) async {
    final SharedPreferences userCredentials = await SharedPreferences.getInstance();
    userCredentials.setString("Email", userEmail);
    userCredentials.setString("Password", userPassword);
  }
}
