import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:netflixclone/app/common/movie_card.dart';
import 'package:netflixclone/app/modules/home/views/find_view.dart';

import '../../../common/app_utils.dart';
import '../controllers/home_controller.dart';
import 'description_view.dart';
import 'screen.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/profile.png',
                scale: 2,
              ),
            )
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (homeController.tv.isNotEmpty)
                  SizedBox(
                      // color: Colors.red,
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
                                          'https://image.tmdb.org/t/p/w500' +
                                              homeController.tv[index]
                                                  ['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              homeController.tv[index]
                                                  ['poster_path'],
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
                                // color: Colors.green,
                                width: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500' +
                                                    homeController.tv[index]
                                                        ['backdrop_path']),
                                            fit: BoxFit.cover),
                                      ),
                                      height: 140,
                                    ),
                                    AppConstants.h_5,
                                    Container(
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
                if (homeController.tv.isEmpty)
                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                if (homeController.trendingmovies.isNotEmpty)
                  TrendingMovies(
                    trending: homeController.trendingmovies,
                  ),
                // if (homeController.trendingmovies.isNotEmpty)
                //   MovieCardContainer(
                //       themeColor: AppConstants.kMainGreenColor,
                //       scrollController: homeController.scrollController!,
                //       movieCards: genMovie())
                if (homeController.trendingmovies.isEmpty)
                  Container(
                      height: 150,
                      child: const CircularProgressIndicator(
                        color: Colors.red,
                      )),
                if (homeController.topratedmovies.isNotEmpty)
                  TopRatedMovies(
                    toprated: homeController.topratedmovies,
                  ),
                if (homeController.trendingmovies.isEmpty)
                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
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

  genMovie(int len, List list) {
    final List<Padding> mc = List.generate(
        homeController.trendingmovies.length,
        (index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  //Get.to(Description(name: name, description: description, bannerurl: bannerurl, posterurl: posterurl, vote: vote, launchon: launchon))
                },
                child: MovieCard(
                    moviePreview: MoviePreview(
                      id: "${homeController.trendingmovies[index]['id']}",
                      imageUrl:
                          "${AppConstants.kThemoviedbImageURL}${homeController.trendingmovies[index]["poster_path"]}",
                      isFavorite: false,
                      overview: homeController.trendingmovies[index]
                          ['overview'],
                      rating: double.parse(homeController.trendingmovies[index]
                              ['vote_average']
                          .toString()),
                      year: getYear(
                          "${homeController.trendingmovies[index]['year']}"),
                      title: "${homeController.trendingmovies[index]['title']}",
                    ),
                    themeColor: AppConstants.kMainGreenColor),
              ),
            ));
    return mc;
  }
}

class MovieCardContainer extends StatelessWidget {
  final Color themeColor;
  final ScrollController scrollController;
  final List<Padding> movieCards;

  const MovieCardContainer({
    required this.themeColor,
    required this.scrollController,
    required this.movieCards,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding:AppConstants.all_10,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: movieCards,
          ),
        ),
      ),
    );
  }
}
