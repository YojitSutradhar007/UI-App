import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/router/route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'provider/provider.dart';
import 'resources/import_resources.dart';
import 'resources/resources.dart';
import 'view/splash_screen/splash_screen.dart';
import 'view_models/product_view_model.dart';

import 'package:go_router/go_router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => SignInValidation()),
            ChangeNotifierProvider(create: (context) => SignUpValidation()),
            ChangeNotifierProvider(create: (context) => ChangeColor()),
            ChangeNotifierProvider(create: (context) => BottumNavigation()),
            ChangeNotifierProvider(create: (context) => ThemeChange()),
            ChangeNotifierProvider(create: (context) => RangeSlide()),
            ChangeNotifierProvider(create: (context) => Toggle()),
            ChangeNotifierProvider(create: (context) => PageIndex()),
            ChangeNotifierProvider(create: (context) => ProductData()),
            ChangeNotifierProvider(create: (context) => SearchProductData())
          ],
          child: Consumer<ThemeChange>(
            builder: (context, value, child) {
              return MaterialApp.router(
                theme: ThemeData(
                  scaffoldBackgroundColor: ColorManager.whiteColor,
                  fontFamily: "Mukta",
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: ColorManager.blackColor,
                  brightness: Brightness.dark,
                  fontFamily: "Mukta",
                ),
                themeMode: value.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                routerConfig: router,
              );
            },
          ),
        );
      },
    );
  }
}
