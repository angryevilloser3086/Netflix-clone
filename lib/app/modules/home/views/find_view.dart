import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflixclone/app/common/app_utils.dart';

import '../../../common/custom_loader.dart';
import '../../../common/movie_card.dart';
import '../controllers/findview_controller.dart';
import 'home_view.dart';

class FindView extends GetView<FindController> {
  FindView({Key? key}) : super(key: key);
  final FindController homeController = Get.put(FindController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          shadowColor: Colors.transparent.withOpacity(0.1),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppConstants.kSearchAppBarColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: CustomSearchAppbarContent(onChanged: (value) {
              if (value.isEmpty) {
                homeController.clear();
              }
              homeController.textFieldValue = value;
            }, onEditingComplete: () {
              if (homeController.textFieldValue.isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();
                homeController.showloader = false;
                homeController.findMovies(homeController.textFieldValue);
              }
            }),
          ),
        ),
        backgroundColor: AppConstants.kBackgroundShadowColor,
        body: Obx(() => Container(
              child: (homeController.res.isEmpty)
                  ? ((homeController.showloader)
                      ? CustomLoadingSpinKitRing(
                          loadingColor: AppConstants.kMainBlueColor)
                      : null)
                  : (homeController.res.isEmpty)
                      ? const Center(
                          child: Text(
                          AppConstants.kNotFoundErrorText,
                          style: AppConstants.kSplashScreenTextStyle,
                        ))
                      : MovieCardContainer(
                          scrollController: homeController.scrollController ??
                              ScrollController(),
                          themeColor: AppConstants.kMainBlueColor,
                          movieCards:
                              homeController.res.toList().cast<Padding>(),
                        ),

              // floatingActionButton: showBackToTopButton
              //     ? ShadowlessFloatingButton(
              //         backgroundColor: widget.themeColor,
              //         iconData: Icons.keyboard_arrow_up_outlined,
              //         onPressed: () =>
              //             ,
              //       )
              //     : null,
            )));
  }

  genMovie(int len, List list) {
    final List<Padding> mc = List.generate(
        len,
        (index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  //Get.to(Description(name: name, description: description, bannerurl: bannerurl, posterurl: posterurl, vote: vote, launchon: launchon))
                },
                child: MovieCard(
                    moviePreview: MoviePreview(
                      id: "${list[index]['id']}",
                      imageUrl:
                          "${AppConstants.kThemoviedbImageURL}${list[index]["poster_path"]}",
                      isFavorite: false,
                      overview: list[index]['overview'],
                      rating:
                          double.parse(list[index]['vote_average'].toString()),
                      year: getYear("${list[index]['year']}"),
                      title: "${list[index]['title']}",
                    ),
                    themeColor: AppConstants.kMainGreenColor),
              ),
            ));
    return mc;
  }

  getYear(String yr) {
    String year = '';
    (yr.length > 4) ? year = yr.substring(0, 4) : year = "";
    return year;
  }
}

class CustomSearchAppbarContent extends StatelessWidget {
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;

  const CustomSearchAppbarContent(
      {Key? key, this.onChanged, this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: AppConstants.kAppBarColor,
      child: Center(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            style: AppConstants.kDrawerDescTextStyle,
            cursorColor: Colors.white,
            autofocus: true,
            autocorrect: false,
            textInputAction: TextInputAction.search,
            decoration: AppConstants.kTextFieldDecoration,
          ),
        ),
      ),
    );
  }
}
