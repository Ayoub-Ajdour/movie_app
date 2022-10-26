import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/AfficheMoviebyGenre.dart';
import 'package:movie_app/Home/Movie.dart';

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        child: Text(
          genre,
          style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
        ),
        onPressed: () {
          // AfficheMoviebyGenre(genre: genre);
          getMovies(genre);
        },
      ),
    );
  }
}

Future getMovies(genre) async {
  print('$genre');
  DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('movie').doc('$genre').get();
  // print(documentSnapshot.data());
  List movieList =
      (documentSnapshot.data as List).map((m) => fromJson(m)).toList();

  print("heeey again");
}
