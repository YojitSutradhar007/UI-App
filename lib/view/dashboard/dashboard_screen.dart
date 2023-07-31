import 'package:ecommerce/user_preferences/user_preferences.dart';
import 'package:ecommerce/view/home_screen/components/bottom_tabs.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../../provider/bottum_navigation.dart';
import 'package:ecommerce/view/screens.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final userPreferences = UserPreferences();

  bool icon = true;

  final List _pages = [
    HomeScreen(),
    const ShoppingCart(),
    const WishListScreen(),
    const UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Consumer<BottumNavigation>(
          builder: (context, value, child) {
            return _pages[value.selected];
          },
        ),
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            color: RGBColorManager.rgbWhiteColor,
            boxShadow: [
              BoxShadow(
                color: ColorManager.greyOpacityColor,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.w),
              topRight: Radius.circular(25.w),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomTabButton(
                  inDex: 0,
                  onSelectImageAsset: IconsAssets.homeLogo,
                  notSelectImageAsset: IconsAssets.homeUnfilledLogo),
              BottomTabButton(
                  inDex: 1,
                  onSelectImageAsset: IconsAssets.cartLogo,
                  notSelectImageAsset: IconsAssets.cartUnfilledLogo),
              BottomTabButton(
                inDex: 2,
                onSelectImageAsset: IconsAssets.wishListLogo,
                notSelectImageAsset: IconsAssets.wishListUnfilledLogo,
              ),
              BottomTabButton(
                inDex: 3,
                onSelectImageAsset: IconsAssets.userLogo,
                notSelectImageAsset: IconsAssets.userUnfilledLogo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
