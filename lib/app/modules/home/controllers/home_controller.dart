import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netflixclone/app/common/app_utils.dart';
import 'package:netflixclone/app/network/api_request.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  ApiRequest apiRequest = ApiRequest();
  bool showloader = true;
  String textFieldValue = "";
  ScrollController? scrollController;
  static const String apikey = '0e30d510d232032bb097e2c7eb07bf48';
  static const String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZTMwZDUxMGQyMzIwMzJiYjA5N2UyYzdlYjA3YmY0OCIsInN1YiI6IjYzMmU5MTNmOTg4YWZkMDA3ZTIzYmI3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5c___lFw3s2UNEw9ugNcKc3HYs49SyrQ1oBW788Tjac';
  List trendingmovies = [].obs;
  List topratedmovies = [].obs;
  List tv = [].obs;
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
    loadmovies();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController!.dispose();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.movies.getPouplar();
    Map popular = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    trendingmovies.addAll(trendingresult['results']);
    topratedmovies.addAll(topratedresult['results']);
    tv.addAll(tvresult['results']);
    tv.addAll(popular['results']);
  }

  findMovies(String text) async {
    apiRequest
        .searchMovies(movieName: text, themeColor: AppConstants.kMainBlueColor)
        .then((value) {
      res.addAll(value);
      //return print(res.length + 3086);
    }).catchError((r) {
      print(r);
    });
    return res;
  }
}
