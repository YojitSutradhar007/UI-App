import 'package:ecommerce/router/route_name.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import '../../user_preferences/user_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "_SplashScreenState";
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    userPreferences.getUserInfo();
    navigation();
  }

  void navigation() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(
      time,
      () {
        if (userPreferences.email != null &&
            userPreferences.pass != null &&
            userPreferences.email!.isNotEmpty &&
            userPreferences.pass!.isNotEmpty) {
          context.go(RoutesName.homeScreen);
        } else {
          context.go(RoutesName.onBoardingScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
      body: Center(
        child: Lottie.asset(AnimationAssets.splashAnimation),
      ),
    );
  }
}
