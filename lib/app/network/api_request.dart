import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/app/common/app_utils.dart';
import 'dart:convert';

import '../common/movie_card.dart';

class ApiRequest {
  static const String baseUrl =
      "https://api.themoviedb.org/3/movie/550?api_key=0e30d510d232032bb097e2c7eb07bf48";

  static const String apikey = '0e30d510d232032bb097e2c7eb07bf48';

  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  Future<List<Padding>> searchMovies({
    required String movieName,
    required Color themeColor,
  }) async {
    List<Padding> temp = [];

    var data = await _getData(
      url:
          '${AppConstants.kThemoviedbSearchURL}/?api_key=${apikey}&language=en-US&page=1&include_adult=false&query=$movieName',
    );

    print(data);

    for (var item in data["results"]) {
      try {
        temp.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieCard(
              moviePreview: MoviePreview(
                // isFavorite:
                //     await isMovieInFavorites(movieID: item["id"].toString()),
                year: (item["release_date"].toString().length > 4)
                    ? item["release_date"].toString().substring(0, 4)
                    : "",
                imageUrl: "https://image.tmdb.org/t/p/w500${item["poster_path"]}",
                title: item["title"],
                id: item["id"].toString(),
                rating: item["vote_average"].toDouble(),
                overview: item["overview"], isFavorite: false,
              ),
              themeColor: themeColor,
            ),
          ),
        );
      } catch (e, s) {
        print(s);
        print(item["release_date"]);
      }
    }
    return Future.value(temp);
  }
}

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
