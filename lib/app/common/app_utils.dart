import 'package:flutter/material.dart';

import 'movie_card.dart';

class AppConstants {
static const kThemoviedbURL = "https://api.themoviedb.org/3/movie";
static const kThemovieDiscoverdbURL = "https://api.themoviedb.org/3/discover/movie";
static const kThemoviedbSearchURL = "https://api.themoviedb.org/3/search/movie";
static const kThemoviedbImageURL = "https://image.tmdb.org/t/p/w500";
static const kHomeScreenButtonFirstText = "Populars";
static const kHomeScreenButtonSecondText = "Coming Soon";
static const kHomeScreenButtonThirdText = "Top Rated";
static const kHomeScreenTitleText = "Watch Now";
static const k404Text = "Movies not found";
static const kFavoriteRemovedText = "Movie removed from Favorites";
static const kFavoriteAddedText = "Movie added to Favorites";
static const kDetailsScreenTitleText = "Overview";
static const kStoryLineTitleText = "Storyline";
static const kSplashScreenTitleText = "loading..";
static const kFinderScreenTitleText = "Finder";
static const kFavoriteScreenTitleText = "Favorites";
static const kDrawerTitleFirstText = "THEME";
static const kDrawerTitleSecondText = "ABOUT";
static const kDrawerTitleThirdText = "DEPENDENCIES";
static const kAppliedTheme = "Theme applied";
static const kNotFoundErrorText = "Not found";
static const kDrawerAboutDescText =
    "Hi, I am a practicing Flutter developer. You see currently my portfoliowork, which is based on the themoviedb API. If you want to see my future developments, follow me on GitHub (vellt).";
static const kDrawerDependenciesDescText =
    "\t• sizer\n\t• flutter_spinkit\n\t• cached_network_image\n\t• fluttertoast\n\t• http\n\t• path_provider";


static const kTextShadow = [
  Shadow(offset: Offset(0, 0.1), blurRadius: 6.0, color: kTextShadowColor),
];

static const kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 5,
    blurRadius: 30,
    offset: Offset(0, 3),
  ),
];

static const kHomeScreenButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

static const kBoldTitleTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

static const kTitleTextStyle = TextStyle(
  fontSize: 12,
  shadows: kTextShadow,
);

static const kDrawerDescTextStyle = TextStyle(
  fontSize: 14,
  color: kDrawerTextColor,
  height: 0.19,
);

static const kAppBarTitleTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

static const kSplashScreenTextStyle = TextStyle(
  fontSize: 12.0,
  color: kLightGrey,
);

static const kSubTitleCardBoxTextStyle = TextStyle(
  color: kSubTitleCardBoxColor,
  fontSize: 9,
);

static const kSmallAppBarTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

static const kSmallTitleTextStyle = TextStyle(fontSize: 18);

static const kTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

static const kMovieAppBarTitleTextStyle = TextStyle(fontSize: 22);

static const kDetailScreenBoldTitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
static const kDetailScreenRegularTitle = TextStyle(
  fontSize: 20,
);

  static const kMainGreenColor = Color(0xFF37A45E);
  static const kMainOrangeColor = Color(0xFFE58901);
  static const kMainBlueColor = Color(0xFF2C78C5);
  static const kMainPinkColor = Color(0xFFE84CAF);
  static const kPrimaryColor = Color(0xFF101010);
  static const kLightGrey = Color(0xFF545454);
  static const kAppBarColor = Color(0xFF1C1C1C);
  static const kTextShadowColor = Color(0x4D000000);
  static const kBackgroundShadowColor = Color(0x4D161616);
  static const kDrawerLineColor = Color(0xFF707070);
  static const kInactiveButtonColor = Color(0xFF474747);
  static const kDrawerTextColor = Color(0xFFBEBEBE);
  static const kSubTitleCardBoxColor = Color(0xFF8E8E8E);
  static const kSearchAppBarColor = Color(0xFF161616);

  static const appBorderColor = Color(0xFF494757);
  static const borderRadius_10 = BorderRadius.all(Radius.circular(10));
  static var borderAll_10 = Border.all(color: appBorderColor);

  static const h_5 = SizedBox(height: 5);
  static const h_10 = SizedBox(height: 10);
  static const h_20 = SizedBox(height: 20);
  static const h_30 = SizedBox(height: 30);
  static const h_40 = SizedBox(height: 40);
  static const h_50 = SizedBox(height: 50);
  static const h_60 = SizedBox(height: 60);

  static const w_5 = SizedBox(width: 5);
  static const w_10 = SizedBox(width: 10);
  static const w_15 = SizedBox(width: 15);
  static const w_20 = SizedBox(width: 20);
  static const w_25 = SizedBox(width: 25);
  static const w_30 = SizedBox(width: 30);
  static const w_40 = SizedBox(width: 40);

  static const all_5 = EdgeInsets.all(5);
  static const all_10 = EdgeInsets.all(10);
  static const all_15 = EdgeInsets.all(15);
  static const all_20 = EdgeInsets.all(20);
  static const all_100 = EdgeInsets.all(100);



  static const leftRight_5 = EdgeInsets.only(left: 5, right: 5);
  static const leftRight_10 = EdgeInsets.only(left: 10, right: 10);
  static const leftRight_20 = EdgeInsets.only(left: 20, right: 20);

  static const left10 = EdgeInsets.only(left: 10);
  static const left20 = EdgeInsets.only(left: 20);
  static const left100 = EdgeInsets.only(left: 100);


  
  static const loader = Center(
      child: CircularProgressIndicator(color: Colors.red));
  

}


class ModifiedText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;

  const ModifiedText({Key? key, required this.text, this.color, this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline4);
  }
  static  List<Widget> getStars({required double? rating, required double starSize}) {
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
