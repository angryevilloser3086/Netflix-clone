import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/home_view.dart';

class LoginController extends GetxController {
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();
  final getStorage = GetStorage();
  String verificationCode = '';
  @override
  void onInit() {
    phoneTextController = TextEditingController();
    otpTextController = TextEditingController();
    super.onInit();
  }

  verifyPhone(String phone) async {
    //var credential = PhoneAuthProvider.credential(verificationId: , smsCode: smsCodeController.text);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          Get.showSnackbar(GetSnackBar(message: e.message));
        },
        codeSent: (String verficationID, int? resendToken) async {
          //getStorage.write("verificationID", verficationID);
          //verificationCode = verficationID;
          // print("${resendToken} resendToken");
          // print("$verficationID codesent");
          verificationCode = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
          getStorage.write("verificationID", verificationID);
          // Get.showSnackbar(GetSnackBar(message: verificationID));
          // Get.offAllNamed(Routes.OTPSCREEN);
        },
        timeout: const Duration(seconds: 120));
  }

  Future otpSaved() async {
    // print(verificationCode);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode,
              smsCode: otpTextController.text))
          .then((value) async {
        if (value.user != null) {
          getStorage.write("id", value.user?.uid);
          Get.offAll(() => HomeView());
        }
      });
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(GetSnackBar(message: e.toString()));
    }
  }

  @override
  void onClose() {
    phoneTextController.dispose();
    super.onClose();
  }
}
