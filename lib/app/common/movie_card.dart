import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/app/common/app_utils.dart';
import 'package:netflixclone/app/modules/home/views/description_view.dart';

import 'custom_loader.dart';

final GlobalKey kHomeScreenKey = GlobalKey();

class MovieCard extends StatelessWidget {
  final MoviePreview moviePreview;
  final Color themeColor;
  final int? contentLoadedFromPage;

   const MovieCard({Key? key, 
    required this.moviePreview,
    required this.themeColor,
    this.contentLoadedFromPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = getStars(rating: double.parse(moviePreview.rating), starSize: 2);

    return InkWell(
      onTap: () => Get.to(() => Description(
          name: moviePreview.title,
          description: moviePreview.overview,
          bannerurl: moviePreview.bannerUrl ?? moviePreview.imageUrl ?? "",
          posterurl: moviePreview.imageUrl ?? "",
          vote: moviePreview.rating,
          launchon: moviePreview.year)),
      child: Padding(
        padding: AppConstants.all_5,
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.2),
                  child: CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Column(
                            children: [
                              SizedBox(
                                height: 20,
                                child: CustomLoadingSpinKitRing(
                                    loadingColor: themeColor),
                              )
                            ],
                          ),
                      imageUrl: moviePreview.imageUrl!,
                      errorWidget: (context, url, error) => Column(
                            children: [
                              SizedBox(
                                height: 20,
                                child: CustomLoadingSpinKitRing(
                                    loadingColor: themeColor),
                              )
                            ],
                          )),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                children: [
                                  AppConstants.h_30,
                                  Text("${moviePreview.title} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                  Text(
                                      (moviePreview.year == "")
                                          ? ""
                                          : "(${moviePreview.year})",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                            ),
                            if (moviePreview.isFavorite)
                              const Icon(
                                Icons.bookmark_sharp,
                                size: 15,
                                color: AppConstants.kInactiveButtonColor,
                              ),
                          ],
                        ),
                        AppConstants.h_5,
                        if (stars.isNotEmpty) Row(children: stars),
                        AppConstants.h_5,
                        // SizedBox(
                        //   width: 50,
                        //   child: Text(
                        //     moviePreview.overview,
                        //     style: AppConstants.kSubTitleCardBoxTextStyle,
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 3,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getStars({required double? rating, required double starSize}) {
    List<StarIcon> temp = [];
    if (rating != null) {
      for (var i = 0; i < rating ~/ 2; i++) {
        //(rating/2).toInt() == rating ~/ 2
        temp.add(StarIcon(
          icon: Icons.star,
          size: starSize,
        ));
      }
      if (rating > 0 && rating % 2 != 0) {
        temp.add(StarIcon(
          icon: Icons.star_half,
          size: starSize,
        ));
      }
      while (temp.length < 5) {
        temp.add(StarIcon(
          icon: Icons.star_border,
          size: starSize,
        ));
      }
    }
    return temp;
  }
}

class MoviePreview {
  final String id;
  final String title;
  final String? imageUrl;
  final String? bannerUrl;
  final String year;
  final bool isFavorite;
  final String rating;
  String overview;

  MoviePreview({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.isFavorite,
    required this.overview,
    required this.rating,
    required this.bannerUrl,
  });
}

class StarIcon extends StatelessWidget {
  final IconData icon;
  final double size;

   const StarIcon({Key? key, required this.icon, required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.yellow,
      size: size,
    );
  }
}
