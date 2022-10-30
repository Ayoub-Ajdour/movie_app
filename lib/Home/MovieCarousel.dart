import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Details/details_screen.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:animations/animations.dart';
import 'package:movie_app/Home/home.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: AspectRatio(
          aspectRatio: 1.3,
          child: FutureBuilder(
              future: getdata(),
              builder: (context, dynamic snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                      controller: _pageController,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: OpenContainer(
                              closedElevation: 0,
                              openElevation: 0,
                              closedBuilder: (context, action) => Container(
                                color: Color.fromARGB(66, 90, 90, 90),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              fit: BoxFit.values.first,
                                              image: AssetImage(
                                                  "${snapshot.data.docs[index]['backdrop']}"))),
                                    )),
                                    Text(
                                      "${snapshot.data.docs[index]['title']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: <Widget>[
                                    //     SvgPicture.asset(
                                    //       "assets/icons/star_fill.svg",
                                    //       height: 20,
                                    //     ),
                                    //     const SizedBox(width: 30 / 2),
                                    //     Text(
                                    //       "${movie.rating}",
                                    //       style: Theme.of(context).textTheme.bodyText2,
                                    //     )
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                              openBuilder: (context, action) => DetailsScreen(
                                  movie: snapshot.data.docs[index]['id'] - 1),
                            ),
                          ));
                  // return Column(
                  //   children: <Widget>[
                  //     Image(
                  //         image: AssetImage(
                  //             "${snapshot.data.docs[index]['backdrop']}")),
                  //     Text(
                  //       "${snapshot.data.docs[index]['title']}",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  // buildMovieCard(BuildContext context) {

  // }
}
