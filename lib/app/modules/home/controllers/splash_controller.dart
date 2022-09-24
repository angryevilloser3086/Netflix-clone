import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netflixclone/app/modules/home/views/screen.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read('id') != null) {
      //Get.offAllNamed(Routes.HOME);
      Get.off(() => MyHomePage());
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
