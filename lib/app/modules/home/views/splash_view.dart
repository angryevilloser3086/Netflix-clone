import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
   SplashScreen({Key? key}) : super(key: key);
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  _body() {
    return const SafeArea(
        child: Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            )));
  }
}
