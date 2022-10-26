import 'package:flutter/material.dart';
import 'package:movie_app/Home/GenreCard.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:movie_app/Home/home.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final int movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
      child: FutureBuilder(
          future: getdata(),
          builder: (context, dynamic snapshot) {
            if (snapshot.hasData) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GENRES",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(129, 0, 0, 0)),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 36,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.docs[movie]['genra'].length,
                        itemBuilder: (context, index) => Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5, // 5 padding top and bottom
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(251, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${snapshot.data.docs[movie]['genra'][index]}",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ]);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
