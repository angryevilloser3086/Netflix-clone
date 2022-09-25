import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/app/common/app_utils.dart';
import 'package:netflixclone/app/network/api_request.dart';

class FindController extends GetxController {
  ApiRequest apiRequest = ApiRequest();
  bool showloader = false;
  String textFieldValue = "";
  ScrollController? scrollController;

  List res = [].obs;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    //sloadmovies();
  }

  @override
  void onReady() {
    scrollController = ScrollController();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController!.dispose();
    res.clear();
  }

  void clear() {
    res.clear();
  }

  findMovies(String text) async {
    showloader = true;
    apiRequest
        .searchMovies(movieName: text, themeColor: AppConstants.kMainBlueColor)
        .then((value) {
      showloader = false;
      res.addAll(value);
      print(res.length + 3086);
    }).catchError((r) {
      print(r);
    });
    return res;
  }
}
