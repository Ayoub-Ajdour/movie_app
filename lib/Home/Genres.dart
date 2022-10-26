import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/GenreCard.dart';
import 'package:movie_app/Home/MovieByGenre.dart';

class Genres extends StatefulWidget {
  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "h",
      "ACTION",
      "ADVENTURE",
      "ROMANTIC",
      "COMEDY",
      "DRAMA",
      "ANIMATION",
    ];
    String genreselectionner;
    return Container(
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
                  ),
                  child: TextButton(
                    child: Text(
                      "${snapshot.data.docs[index]['name']}",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 16),
                    ),
                    onPressed: () {
                      // AfficheMoviebyGenre(genre: genre);
                      //getMovies(genre);
                      setState(() {
                        genreselectionner = snapshot.data.docs[index]['name'];
                        //  MovieByGenre(genreselectionner);
                        // print(genreselectionner);
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
    );
  }

  Future moviebyg({c = "ACTION"}) async {
    MovieByGenre(c);
  }

  getdatagenre() async {
    var result = await FirebaseFirestore.instance.collection('genre').get();
    return result;
  }
}
