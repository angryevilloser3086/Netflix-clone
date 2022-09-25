import 'package:get/get.dart';
import 'package:netflixclone/app/modules/home/bindings/login_bindings.dart';
import 'package:netflixclone/app/modules/home/bindings/otp_binding.dart';
import 'package:netflixclone/app/modules/home/bindings/splash_binding.dart';
import 'package:netflixclone/app/modules/home/views/login_view.dart';
import 'package:netflixclone/app/modules/home/views/otp_view.dart';
import 'package:netflixclone/app/modules/home/views/splash_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () =>  SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => OTPView(),
      binding: OTPBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
