// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/Actors.dart';
import 'package:movie_app/Home/MovieByGenre.dart';
import 'package:movie_app/Home/MovieCarousel.dart';
import 'package:movie_app/Home/genres.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  //
  //
  // QueryDocumentSnapshot<Object?> c;
  @override
  Widget build(BuildContext context) {
    // it enable scroll on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MovieCarousel(),
          // SizedBox(height: 30),
          // Genres(),
          SizedBox(
            height: 10,
          ),
          // const Text(
          //   "NOW PLAYING",
          //   //style: Theme.of(context).textTheme.headline5,
          //   // textAlign: TextAlign.left,
          // ),
          MovieByGenre("ACTION"),
          const Actors(),
        ],
      ),
    );
  }
}
