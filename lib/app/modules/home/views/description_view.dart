import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_utils.dart';
import '../../../common/movie_card.dart';
import '../controllers/home_controller.dart';

class Description extends GetView<HomeController> {
  final String name, description, bannerurl, posterurl, vote, launchon;

  Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(vote);
    List<Widget> stars = getStars(rating: double.parse(vote), starSize: 20);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          SizedBox(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: InkWell(
                    onTap: () async {},
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    child: Padding(
                      padding: AppConstants.all_10,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 10,
                    child: (stars.length != 0)
                        ? Row(children: stars)
                        : ModifiedText(
                            text: '⭐ Average Rating - $vote',
                            color: Colors.white,
                          )),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                text: name,
                size: 24,
                color: Colors.white,
              )),
          Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                text: 'Releasing On - $launchon',
                size: 14,
                color: Colors.white,
              )),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ModifiedText(
                      text: description,
                      size: 18,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        ]),
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
