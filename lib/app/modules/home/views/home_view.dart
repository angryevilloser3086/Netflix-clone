import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/home/views/find_view.dart';
import '../../../common/app_utils.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'description_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: Image.asset(
            "assets/logo.png",
            height: 3,
          ),
          actions: [
            InkWell(
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onTap: () => Get.to(() => FindView()),
            ),
            InkWell(
              onTap: () {
                homeController.getStorage.remove("id");
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/profile.png',
                  scale: 2,
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                AppConstants.h_10,
                if (homeController.tv.isNotEmpty)
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.tv.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => Description(
                                      name:
                                          "${homeController.tv[index]['title'].toString()} ",
                                      bannerurl:
                                          "${AppConstants.kThemoviedbImageURL}${homeController.tv[index]['backdrop_path']}",
                                      posterurl:
                                          "${AppConstants.kThemoviedbImageURL}${homeController.tv[index]['poster_path']}",
                                      description: homeController.tv[index]
                                          ['overview'],
                                      vote: homeController.tv[index]
                                              ['vote_average']
                                          .toString(),
                                      launchon:
                                          "${homeController.tv[index]['release_date']} ",
                                    ));
                              },
                              child: Container(
                                padding: AppConstants.all_5,
                                width: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${AppConstants.kThemoviedbImageURL}${homeController.tv[index]['backdrop_path']}"),
                                            fit: BoxFit.cover),
                                      ),
                                      height: 140,
                                    ),
                                    AppConstants.h_5,
                                    SizedBox(
                                      child: ModifiedText(
                                        size: 15,
                                        text: homeController.tv[index]
                                                ['title'] ??
                                            'Loading',
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })),
                if (homeController.tv.isEmpty) AppConstants.loader,
                if (homeController.trendingmovies.isNotEmpty)
                  TrendingMovies(
                    trending: homeController.trendingmovies,
                  ),
                if (homeController.trendingmovies.isEmpty) AppConstants.loader,
                if (homeController.topratedmovies.isNotEmpty)
                  TopRatedMovies(
                    toprated: homeController.topratedmovies,
                  ),
                if (homeController.trendingmovies.isEmpty) AppConstants.loader,
              ],
            ),
          ),
        ));
  }

  getYear(String yr) {
    String year = '';
    (yr.length > 4) ? year = yr.substring(0, 4) : year = "";
    return year;
  }
}

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => Description(
                              name:
                                  "${trending[index]['title'] ?? trending[index]['original_name']} ",
                              bannerurl:
                                  "${AppConstants.kThemoviedbImageURL}${trending[index]['backdrop_path']}",
                              posterurl:
                                  "${AppConstants.kThemoviedbImageURL}${trending[index]['poster_path']}",
                              description:
                                  trending[index]['overview'].toString(),
                              vote: trending[index]['vote_average'].toString(),
                              launchon:
                                  trending[index]['release_date'].toString(),
                            ));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${AppConstants.kThemoviedbImageURL}${trending[index]['poster_path']}"),
                                ),
                              ),
                              height: 200,
                            ),
                            AppConstants.h_5,
                            SizedBox(
                              child: ModifiedText(
                                  size: 15,
                                  text: trending[index]['title'] ??
                                      trending[index]['original_name']),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => Description(
                              name: "${toprated[index]['title'].toString()} ",
                              bannerurl:
                                  "${AppConstants.kThemoviedbImageURL}${toprated[index]['backdrop_path']}",
                              posterurl:
                                  "${AppConstants.kThemoviedbImageURL}${toprated[index]['poster_path']}",
                              description: toprated[index]['overview'],
                              vote: toprated[index]['vote_average'].toString(),
                              launchon: toprated[index]['release_date'],
                            ));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${AppConstants.kThemoviedbImageURL}${toprated[index]['poster_path']}"),
                                ),
                              ),
                              height: 200,
                            ),
                            AppConstants.h_5,
                            SizedBox(
                              child: ModifiedText(
                                size: 15,
                                text: toprated[index]['title'] ?? 'Loading',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
