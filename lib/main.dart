import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

bool shouldUseFirebaseEmulator = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAMna8wwSBsDxMtUT0KS0mka4p4BX2yK1U',
          appId: '1:1071914213590:android:102dd9613a5b021cfea977',
          messagingSenderId: '1071914213590',
          projectId: 'netflixclone-65dd6',
          storageBucket: "netflixclone-65dd6.appspot.com"),
    );
  }

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Netflix Clone",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme().copyWith(
            headline1: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
            headline2: GoogleFonts.inter(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            headline3: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
            headline4: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            headline5: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            headline6: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            caption: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            bodyText1: GoogleFonts.inter(
                fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
            bodyText2: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            button: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            subtitle1: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        buttonTheme: const ButtonThemeData(
            shape: RoundedRectangleBorder(), buttonColor: Colors.greenAccent),
      ),
    ),
  );
}
