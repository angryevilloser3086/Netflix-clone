import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/app/common/app_utils.dart';
import 'package:pinput/pinput.dart';

import '../../../common/default_btn.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login_screen";

  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppConstants.h_50,
              AppConstants.h_50,
              AppConstants.h_50,
              Center(
                child: TextFormField(
                  onFieldSubmitted: (value) => _loginController
                      .verifyPhone(_loginController.phoneTextController.text),
                  controller: _loginController.phoneTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Phone number',
                    hintStyle: GoogleFonts.exo2(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                    ),
                  ),
                  style: GoogleFonts.exo2(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  validator: (value) =>
                      value!.trim().isEmpty ? 'phone number required' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  controller: _loginController.otpTextController,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmitted: (pin) async {
                    _loginController.otpSaved();
                    // otpController.otpSaved();
                  },
                ),
              ),
              const SizedBox(height: 16),
              DefaultButton(
                text: 'Login',
                press: () {
                  _loginController.otpSaved();
                  // if (_formKey.currentState?.validate() != null) {
                  //   _loginController
                  //       .verifyPhone(_loginController.phoneTextController.text);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
