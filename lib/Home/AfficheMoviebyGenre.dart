// ignore_for_file: must_be_immutable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AfficheMoviebyGenre extends StatelessWidget {
  AfficheMoviebyGenre({super.key, required String genre});
  late String genre;
  @override
  Widget build(BuildContext context) {
    print(this.genre);
    return Container(
      child: Text("heeyy" + genre),
    );
  }
}

// Future getMovies() async {
//   DatabaseReference ref = FirebaseDatabase.instance.ref('movie/{$genre}');
// }
