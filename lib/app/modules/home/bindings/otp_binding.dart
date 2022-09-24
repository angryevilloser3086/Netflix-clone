import 'package:get/get.dart';
import 'package:netflixclone/app/modules/home/controllers/otp_controllers.dart';

class OTPBinding  extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
