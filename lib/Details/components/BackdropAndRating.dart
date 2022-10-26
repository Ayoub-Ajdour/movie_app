// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:movie_app/Home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class BackdropAndRating extends StatefulWidget {
  const BackdropAndRating({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final int movie;

  @override
  State<BackdropAndRating> createState() => _BackdropAndRatingState();
}

class _BackdropAndRatingState extends State<BackdropAndRating> {
  var rateb = false;
  var watchlaterb = false;
  @override
  Widget build(BuildContext context) {
    // int j = 1;
    return SizedBox(
        // 40% of our total height
        height: widget.size.height * 0.4,
        child: FutureBuilder(
            future: getdata(),
            builder: (context, dynamic snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: widget.size.height * 0.4 - 10,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "${snapshot.data.docs[widget.movie]['backdrop']}"),
                        ),
                      ),
                    ),
                    // Rating Box
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                        // it will cover 90% of our total width
                        width: widget.size.width * 0.9,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(142, 255, 255, 255),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 50,
                              color: const Color(0xFF12153D).withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 18),
                                  SvgPicture.asset(
                                      "assets/icons/star_fill.svg"),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              "${snapshot.data.docs[widget.movie]['rating']}/",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const TextSpan(text: "10\n"),
                                        const TextSpan(
                                          text: "150,212",
                                          style:
                                              TextStyle(color: Colors.black12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  // const SizedBox(height: 7),

                                  // SvgPicture.asset("assets/icons/star.svg"),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        rateb = !rateb;
                                      });
                                      addittofavorite(
                                        snapshot.data.docs[widget.movie]['id'],
                                        snapshot.data.docs[widget.movie]
                                            ['title'],
                                        snapshot.data.docs[widget.movie]
                                            ['year'],
                                        snapshot.data.docs[widget.movie]
                                            ['poster'],
                                        snapshot.data.docs[widget.movie]
                                            ['backdrop'],
                                        snapshot.data.docs[widget.movie]
                                            ['numOfRatings'],
                                        snapshot.data.docs[widget.movie]
                                            ['rating'],
                                        snapshot.data.docs[widget.movie]
                                            ['criticsReview'],
                                        snapshot.data.docs[widget.movie]
                                            ['metascoreRating'],
                                        snapshot.data.docs[widget.movie]
                                            ['genra'],
                                        snapshot.data.docs[widget.movie]
                                            ['plot'],
                                        snapshot.data.docs[widget.movie]
                                            ['cast'],
                                        snapshot.data.docs[widget.movie]
                                            ['director'],
                                        snapshot.data.docs[widget.movie]
                                            ['plotText'],
                                        snapshot.data.docs[widget.movie]
                                            ['productioncompany'],
                                        snapshot.data.docs[widget.movie]
                                            ['runtime'],
                                      );
                                    },
                                    icon: Icon(
                                      rateb
                                          ? Icons.star_rate_rounded
                                          : Icons.star_border_rounded,
                                      size: 42,
                                    ),
                                  ),
                                  const SizedBox(height: 0),
                                  const Text("Rate This",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              // Rate this
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  const SizedBox(height: 9),

                                  // SvgPicture.asset("assets/icons/star.svg"),

                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          watchlaterb = !watchlaterb;
                                        });
                                        addittowatchlater(
                                          snapshot.data.docs[widget.movie]
                                              ['id'],
                                          snapshot.data.docs[widget.movie]
                                              ['title'],
                                          snapshot.data.docs[widget.movie]
                                              ['year'],
                                          snapshot.data.docs[widget.movie]
                                              ['poster'],
                                          snapshot.data.docs[widget.movie]
                                              ['backdrop'],
                                          snapshot.data.docs[widget.movie]
                                              ['numOfRatings'],
                                          snapshot.data.docs[widget.movie]
                                              ['rating'],
                                          snapshot.data.docs[widget.movie]
                                              ['criticsReview'],
                                          snapshot.data.docs[widget.movie]
                                              ['metascoreRating'],
                                          snapshot.data.docs[widget.movie]
                                              ['genra'],
                                          snapshot.data.docs[widget.movie]
                                              ['plot'],
                                          snapshot.data.docs[widget.movie]
                                              ['cast'],
                                          snapshot.data.docs[widget.movie]
                                              ['director'],
                                          snapshot.data.docs[widget.movie]
                                              ['plotText'],
                                          snapshot.data.docs[widget.movie]
                                              ['productioncompany'],
                                          snapshot.data.docs[widget.movie]
                                              ['runtime'],
                                        );
                                      },
                                      icon: Icon(
                                        watchlaterb
                                            ? Icons.watch_later_rounded
                                            : Icons.watch_later_outlined,
                                        size: 30,
                                      )),
                                  // const SizedBox(height: 4),
                                  const Text("Watch Later",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    //   padding: const EdgeInsets.all(),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(0, 81, 207, 102),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: IconButton(
                                        icon: Image.asset(
                                            'assets/images/youtube.png'),
                                        color: Colors.white,
                                        onPressed: () async {
                                          const url =
                                              'https://www.google.com/?hl=fr';
                                          // ignore: deprecated_member_use
                                          if (await canLaunch(url)) {
                                            // ignore: deprecated_member_use
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }),

                                    // child: Text(
                                    //   "${movie.metascoreRating}",
                                    //   style: const TextStyle(
                                    //     fontSize: 16,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                  ),
                                  //  const SizedBox(height: 30 / 4),
                                  const Text(
                                    "Review",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Back Button
                    const SafeArea(child: BackButton()),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  void addittowatchsslater(Movie movie) {
    // DatabaseReference ref =
    //     FirebaseDatabase.instance.ref("watchlatter/watchlatter");

    final docUser =
        FirebaseFirestore.instance.collection('watchlatter').doc('watchlatter');
    var s = {
      'id': movie.id,
      'title': movie.title,
      'year': movie.year,
      'poster': movie.poster,
      'backdrop': movie.backdrop,
      'numOfRatings': movie.numOfRatings,
      'rating': movie.rating,
      'criticsReview': movie.criticsReview,
      'metascoreRating': movie.metascoreRating,
      'genra': movie.genra,
      'plot': movie.plot,
      'cast': movie.cast,
      'director': movie.director,
      'plotText': movie.plotText,
      'productioncompany': movie.productioncompany,
      'runtime': movie.runtime,
    };
    docUser.set(s);
    // ref.set(s);
  }
}

Future addittowatchlater(doc, doc2, doc3, doc4, doc5, doc6, doc7, doc8, doc9,
    doc10, doc11, doc12, doc13, doc14, doc15, doc16) async {
  final now = DateTime.now();
  print(now);
  final docUser =
      FirebaseFirestore.instance.collection('watchlatter').doc('watchlatter');
  var s = {
    'id': doc,
    'title': doc2,
    'year': doc3,
    'poster': doc4,
    'backdrop': doc5,
    'numOfRatings': doc6,
    'rating': doc7,
    'criticsReview': doc8,
    'metascoreRating': doc9,
    'genra': doc10,
    'plot': doc11,
    'cast': doc12,
    'director': doc13,
    'plotText': doc14,
    'productioncompany': doc15,
    'runtime': doc16,
    'dateAdd': now.toString()
  };
  docUser.set(s);
}

Future addittofavorite(doc, doc2, doc3, doc4, doc5, doc6, doc7, doc8, doc9,
    doc10, doc11, doc12, doc13, doc14, doc15, doc16) async {
  final now = DateTime.now();
  print(now);
  final docUser =
      FirebaseFirestore.instance.collection('favorite').doc('favorite');
  var s = {
    'id': doc,
    'title': doc2,
    'year': doc3,
    'poster': doc4,
    'backdrop': doc5,
    'numOfRatings': doc6,
    'rating': doc7,
    'criticsReview': doc8,
    'metascoreRating': doc9,
    'genra': doc10,
    'plot': doc11,
    'cast': doc12,
    'director': doc13,
    'plotText': doc14,
    'productioncompany': doc15,
    'runtime': doc16,
    'dateAdd': now.toString()
  };
  docUser.set(s);
}
