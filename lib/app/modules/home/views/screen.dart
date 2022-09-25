import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/app_utils.dart';
import 'description_view.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//       theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apikey = '0e30d510d232032bb097e2c7eb07bf48';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZTMwZDUxMGQyMzIwMzJiYjA5N2UyYzdlYjA3YmY0OCIsInN1YiI6IjYzMmU5MTNmOTg4YWZkMDA3ZTIzYmI3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5c___lFw3s2UNEw9ugNcKc3HYs49SyrQ1oBW788Tjac';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
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
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

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
            Icon(
              Icons.search,
              color: Colors.white,
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
        body: ListView(
          children: [
            TV(tv: tv),
            const ModifiedText(
              text: "Trending movies",
              color: Colors.white,
              size: 18,
            ),
            TrendingMovies(
              trending: trendingmovies,
            ),
            const ModifiedText(
              text: "Top Rated Movies",
              color: Colors.white,
              size: 18,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }
}

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name:
                                          "${toprated[index]['title'].toString()} ",
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launchon: toprated[index]['release_date'],
                                    )));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            Container(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name:
                                          "${trending[index]['title'] ?? trending[index]['original_name']} ",
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview']
                                          .toString(),
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launchon: trending[index]['release_date']
                                          .toString(),
                                    )));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            const SizedBox(height: 5),
                            Container(
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

// class Description extends StatelessWidget {
//   final String name, description, bannerurl, posterurl, vote, launch_on;

//   const Description(
//       {Key? key,
//       required this.name,
//       required this.description,
//       required this.bannerurl,
//       required this.posterurl,
//       required this.vote,
//       required this.launch_on})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         child: ListView(children: [
//           SizedBox(
//               height: 250,
//               child: Stack(children: [
//                 Positioned(
//                   child: InkWell(
//                     onTap: () async {},
//                     child: SizedBox(
//                       height: 250,
//                       width: MediaQuery.of(context).size.width,
//                       child: Image.network(
//                         bannerurl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Center(
//                   child: SizedBox(
//                     height: 50,
//                     width: 50,
//                     child: Icon(
//                       Icons.play_circle,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 10,
//                     child: ModifiedText(
//                       text: '⭐ Average Rating - $vote',
//                       color: Colors.white,
//                     )),
//               ])),
//           const SizedBox(height: 15),
//           Container(
//               padding: const EdgeInsets.all(10),
//               child: ModifiedText(
//                 text: name != null ? name : 'Not Loaded',
//                 size: 24,
//                 color: Colors.white,
//               )),
//           Container(
//               padding: const EdgeInsets.all(10),
//               child: ModifiedText(
//                 text: 'Releasing On - $launch_on',
//                 size: 14,
//                 color: Colors.white,
//               )),
//           Row(
//             children: [
//               SizedBox(
//                 height: 200,
//                 width: 100,
//                 child: Image.network(posterurl),
//               ),
//               Flexible(
//                 child: Container(
//                     padding: const EdgeInsets.all(10),
//                     child: ModifiedText(
//                       text: description,
//                       size: 18,
//                       color: Colors.white,
//                     )),
//               ),
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }
