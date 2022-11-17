import 'package:get/get.dart';
import 'package:shop_app/logic/bindings/auth_biniding.dart';
import 'package:shop_app/logic/bindings/main_biniding.dart';
import 'package:shop_app/logic/bindings/prodect_biniding.dart';
import 'package:shop_app/view/screens/auth/forgot_password.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/screens/auth/signup_screen.dart';
import 'package:shop_app/view/screens/cart_screen.dart';
import 'package:shop_app/view/screens/main_screen.dart';
import 'package:shop_app/view/screens/welcome-screens.dart';

class AppRoutes {
// initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScrenn;
//getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswod(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScrenn,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBinding(), ProdectBinding()],
    ),
    GetPage(
        name: Routes.cartScrenn,
        page: () => CartScreen(),
        bindings: [AuthBinding(), ProdectBinding()]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScrenn = '/mainScrenn';
  static const cartScrenn = '/cartScrenn';
}
