import 'package:ecommerce/router/route_name.dart';

import '../resources/assets_manager.dart';

class OptionButton {
  static List<Option> userAccountOptions_1 = [
    Option(
      label: "Personal details",
      iconAsset: IconsAssets.userLogo,
      navigation: RoutesName.userProfileScreen,
    ),
    Option(
      label: "My order",
      iconAsset: IconsAssets.shoppingBagLogo,
      navigation: RoutesName.shoppingCartScreen,
    ),
    Option(
      label: "My Favorites",
      iconAsset: IconsAssets.wishListLogo,
      navigation: RoutesName.profileWishListScreen,
    ),
    Option(
      label: "Shipping address",
      iconAsset: IconsAssets.shippingLogo,
      navigation: "none",
    ),
    Option(
      label: "Discount Offers",
      iconAsset: IconsAssets.couponsFilledLogo,
      navigation: "none",
    ),
    Option(
      label: "Setting",
      iconAsset: IconsAssets.settingLogo,
      navigation: "none",
    ),
  ];

  static final List<Option> userAccountOptions_2 = [
    Option(
      label: "FAQs",
      iconAsset: IconsAssets.faqsLogo,
      navigation: "none",
    ),
    Option(
      label: "Privacy Policy",
      iconAsset: IconsAssets.privacyPolicyLogo,
      navigation: "none",
    ),
    Option(
      label: "Terms and Conditions",
      iconAsset: IconsAssets.termsLogo,
      navigation: "none",
    ),
    Option(
      label: "About Us",
      iconAsset: IconsAssets.aboutUsLogo,
      navigation: "none",
    ),
  ];
}

class Option {
  Option({
    required this.label,
    required this.iconAsset,
    required this.navigation,
  });

  final String label;
  final String iconAsset;
  final String navigation;
}
