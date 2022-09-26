import 'package:flutter/material.dart';

import '../../../common/app_utils.dart';

class MovieCardContainer extends StatelessWidget {
  final Color themeColor;
  final ScrollController scrollController;
  final List<Padding> movieCards;

  const MovieCardContainer({
    Key? key,
    required this.themeColor,
    required this.scrollController,
    required this.movieCards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: AppConstants.all_10,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: movieCards,
          ),
        ),
      ),
    );
  }
}
