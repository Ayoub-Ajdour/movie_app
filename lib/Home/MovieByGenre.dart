import 'dart:ffi';

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Details/details_screen.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:movie_app/Home/home.dart';

class MovieByGenre extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MovieByGenre(String s, {super.key});

  @override
  State<MovieByGenre> createState() => _MovieByGenreState();
}

class _MovieByGenreState extends State<MovieByGenre> {
  late PageController _pageController;
  int initialPage = 1;
  @override
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

  String genre = "";
  bool c = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.symmetric(vertical: 15),
          height: 45,
          child: FutureBuilder(
              future: getdatagenre(),
              builder: (context, dynamic snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // controller: _pageController,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5, // 5 padding top and bottom
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(62, 175, 163, 163)),
                      child: TextButton(
                        child: Text(
                          "${snapshot.data.docs[index]['name']}",
                          style: TextStyle(
                              color:
                                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                              fontSize: 16),
                        ),
                        onPressed: () {
                          // AfficheMoviebyGenre(genre: genre);
                          //getMovies(genre);
                          setState(() {
                            c = !c;
                            genre = snapshot.data.docs[index]['name'];
                            //  MovieByGenre(genreselectionner);
                            // print(genre);
                          });
                        },
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: AspectRatio(
                aspectRatio: 1.3,
                child: FutureBuilder(
                    future:
                        getdatabyem(), // change it chi w7da tkon m3a cas n changement lissaktna tali t9nt pc
                    builder: (context, dynamic snapshot) {
                      if (snapshot.hasData) {
                        String ss = "";
                        int test = 0;
                        if (genre == "ACTION") {
                          test = 0;
                        } else if (genre == "ADVENTURE") {
                          test = 1;
                        } else if (genre == "ANIMATION") {
                          test = 2;
                        } else if (genre == "COMEDY") {
                          test = 3;
                        } else if (genre == "DRAMA") {
                          test = 4;
                        } else if (genre == "ROMANTIC") {
                          test = 5;
                        } else if (genre == "AMAZIGHI") {
                          test = 6;
                        }
                        // print(test);
                        // print(
                        //     "${snapshot.data.docs[0]["listmovies"][1]['title']}");
                        return PageView.builder(
                            controller: _pageController,
                            itemCount:
                                snapshot.data.docs[test]["listmovies"].length,
                            //  snapshot.data.docs['ACTION']['listmovies'].length,
                            itemBuilder: (context, index) =>
                                Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 10, 20),
                                    child: OpenContainer(
                                      closedElevation: 0,
                                      openElevation: 0,
                                      closedBuilder: (context, action) =>
                                          Container(
                                        color: Color.fromARGB(46, 90, 90, 90),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 20),
                                          child: Column(
                                            children: <Widget>[
                                              // Expanded(
                                              //     child: Container(
                                              //   decoration: BoxDecoration(
                                              //       borderRadius: BorderRadius.circular(10),
                                              //       image: DecorationImage(
                                              //           fit: BoxFit.contain, image: AssetImage(movie.poster))),
                                              // )),
                                              // snapshot.data.docs[index]['genra'][index]==s
                                              Expanded(
                                                  child: Image(
                                                image: AssetImage(
                                                    "${snapshot.data.docs[test]["listmovies"][index]['poster']}"),
                                                fit: BoxFit.contain,
                                              )),
                                              Text(
                                                "${snapshot.data.docs[test]["listmovies"][index]['title']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SvgPicture.asset(
                                                    "assets/icons/star_fill.svg",
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 30 / 2),
                                                  Text(
                                                    "${snapshot.data.docs[test]["listmovies"][index]['rating']}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      openBuilder: (context, action) =>
                                          DetailsScreen(
                                              movie: snapshot.data.docs[test]
                                                          ["listmovies"][index]
                                                      ['id'] -
                                                  1),
                                    ),
                                  ),
///////////////////////
                                  ///

                                  ///
                                  ///
                                ]));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))),
      ],
    );
  }
}

getdatagenre() async {
  var result = await FirebaseFirestore.instance.collection('genre').get();
  return result;
}

getdatabyem() async {
  var result = await FirebaseFirestore.instance.collection('movie').get();
  return result;
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(30, 10, 10, 20),
      //   child: OpenContainer(
      //     closedElevation: 0,
      //     openElevation: 0,
      //     closedBuilder: (context, action) => buildmoviebyGenre(context),
      //     openBuilder: (context, action) => DetailsScreen(movie: movie),
      //   ),
      // ),
///////////////////////
      ///

      ///
      ///
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          children: <Widget>[
            // Expanded(
            //     child: Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       image: DecorationImage(
            //           fit: BoxFit.contain, image: AssetImage(movie.poster))),
            // )),
            Expanded(
                child: Image(
              image: AssetImage(movie.poster),
              fit: BoxFit.contain,
            )),
            Text(
              movie.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/star_fill.svg",
                  height: 20,
                ),
                const SizedBox(width: 30 / 2),
                Text(
                  "${movie.rating}",
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            )
          ],
        ),
      )
    ]);
  }

  Column buildmoviebyGenre(BuildContext context) {
    return Column(
      children: <Widget>[
        // Expanded(
        //     child: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       image: DecorationImage(
        //           fit: BoxFit.contain, image: AssetImage(movie.poster))),
        // )),
        Expanded(
            child: Image(
          image: AssetImage(movie.poster),
          fit: BoxFit.contain,
        )),
        Text(movie.title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w600)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/star_fill.svg",
              height: 20,
            ),
            const SizedBox(width: 15),
            Text(
              "${movie.rating}",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        )
      ],
    );
  }
}
