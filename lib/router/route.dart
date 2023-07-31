import 'package:ecommerce/router/route_name.dart';
import 'package:ecommerce/view/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutesName.onBoardingScreen,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: RoutesName.loginScreen,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RoutesName.signupScreen,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: RoutesName.forgetScreen,
      builder: (context, state) => Forget(),
    ),
    GoRoute(
      path: RoutesName.forgetScreen,
      builder: (context, state) => Forget(),
    ),
    GoRoute(
      path: RoutesName.homeScreen,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: RoutesName.filterScreen,
      builder: (context, state) => const FilterScreen(),
    ),
    GoRoute(
      path: RoutesName.userProfileScreen,
      builder: (context, state) => UserProfile(),
    ),
    GoRoute(
      path: RoutesName.paymentScreen,
      builder: (context, state) => PaymentScreen(),
    ),
    GoRoute(
      path: RoutesName.addPaymentScreen,
      builder: (context, state) => AddPaymentScreen(),
    ),
    GoRoute(
      path: RoutesName.trackingScreen,
      builder: (context, state) => TrackingProduct(),
    ),
    GoRoute(
      path: RoutesName.cartDeliveryScreen,
      builder: (context, state) => CartDelivery(),
    ),
    GoRoute(
      path: RoutesName.categoriesScreen,
      builder: (context, state) => Categories(),
    ),
    GoRoute(
      path: RoutesName.shoppingCartScreen,
      builder: (context, state) => const ProfileShoppingCart(),
    ),
    GoRoute(
      path: RoutesName.selectLanguageScreen,
      builder: (context, state) => SelectLanguage(),
    ),
    GoRoute(
      path: RoutesName.profileWishListScreen,
      builder: (context, state) => ProfileWishListScreen(),
    ),
    GoRoute(
      path: RoutesName.searchProduct,
      builder: (context, state) => const SearchProduct(),
    ),
  ],
);
