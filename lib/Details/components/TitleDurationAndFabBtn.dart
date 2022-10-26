// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:movie_app/Home/home.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final int movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: FutureBuilder(
          future: getdata(),
          builder: (context, dynamic snapshot) {
            if (snapshot.hasData) {
              // print("${snapshot.data.docs[movie]['title']}");
              return Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${snapshot.data.docs[movie]['title']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              fontFamily: 'Peralta-Regular')),
                      const SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Column(children: <Widget>[
                            const Text(
                              "RUN TIME",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(129, 0, 0, 0)),
                            ),
                            Text(
                              "${snapshot.data.docs[movie]['runtime']}",
                              style: const TextStyle(color: Colors.black12),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Column(children: <Widget>[
                            // ignore: prefer_const_constructors
                            Text(
                              "REALEASE DATE",
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(129, 0, 0, 0)),
                            ),
                            Text(
                              "${snapshot.data.docs[movie]['year']}",
                              style: TextStyle(color: Colors.black12),
                            ),
                          ]),
                          const SizedBox(width: 20),
                          Column(children: <Widget>[
                            // ignore: prefer_const_constructors
                            Text(
                              "PRODUCTION COMPANY",
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(129, 0, 0, 0)),
                            ),
                            Text(
                              "${snapshot.data.docs[movie]['productioncompany']}",
                              style: TextStyle(color: Colors.black12),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
