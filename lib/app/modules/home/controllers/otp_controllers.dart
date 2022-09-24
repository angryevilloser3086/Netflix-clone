import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netflixclone/app/modules/home/controllers/login_controller.dart';

import '../views/main_view.dart';

class OTPController extends GetxController {
  TextEditingController otpTextController = TextEditingController();
  LoginController loginController = LoginController();
  String verificationCode = '';
  final getStorage = GetStorage();
  String num = '';
  @override
  void onInit() {
    super.onInit();
    otpTextController = TextEditingController();
    loginController = LoginController();
    verificationCode = getStorage.read('verificationId');
    print(verificationCode);
    num = loginController.phoneTextController.text;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    otpTextController.dispose();
  }

  Future otpSaved() async {
    print(verificationCode);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode,
              smsCode: otpTextController.text))
          .then((value) async {
        if (value.user != null) {
          //getStorage.write("id", value.user?.uid);
          
        }
      });
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(GetSnackBar(message: e.toString()));
    }
  }
}
