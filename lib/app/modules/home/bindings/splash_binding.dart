import 'package:get/get.dart';
import 'package:netflixclone/app/modules/home/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
