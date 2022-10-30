import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Details/components/BackdropAndRating.dart';
import 'package:movie_app/Details/components/CastAndCrew.dart';
import 'package:movie_app/Details/components/Genres.dart';
import 'package:movie_app/Details/components/TitleDurationAndFabBtn.dart';
import 'package:movie_app/Home/Movie.dart';
import 'package:movie_app/Home/home.dart';

class BodyDetail extends StatelessWidget {
  final int movie;

  const BodyDetail({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    // addamazigh();
    // addmovie();
    // addit(this.movie);
    return SingleChildScrollView(
        child: FutureBuilder(
            future: getdata(),
            builder: (context, dynamic snapshot) {
              if (snapshot.hasData) {
                // print("${snapshot.data.docs[movie]['cast'].length}");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BackdropAndRating(size: size, movie: movie),
                    const SizedBox(height: 5),
                    TitleDurationAndFabBtn(movie: movie),
                    Genres(movie: movie),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "OVERVIEW",
                        style: const TextStyle(
                            fontSize: 14, color: Color.fromARGB(129, 0, 0, 0)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "${snapshot.data.docs[movie]['plotText']}",
                        style: const TextStyle(
                          color: Color(0xFF737599),
                        ),
                      ),
                    ),
                    CastAndCrew(
                      casts: movie,
                      directors: movie,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future addamazigh() async {
    final docUser =
        FirebaseFirestore.instance.collection('movie').doc('AMAZIGHI');
    var json = {
      'listmovies': [
        {
          'id': 4,
          'title': "Baba Ali",
          'year': 2021,
          'poster': "assets/images/BabaAli/babaalic.jpg",
          'backdrop': "assets/images/BabaAli/babaalicover.png",
          'numOfRatings': 150212,
          'rating': 9.9,
          'criticsReview': 50,
          'metascoreRating': 79,
          'genra': ["Tamazight", "Drama", "Comedy", "ROMANTIC"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "Ahmed N'tama",
              "movieName": "BABA ALI",
              "image": "assets/images/BabaAli/babaali.jpg",
            },
            {
              "orginalName": "Lhoucaine Berdaouz",
              "movieName": "DAGHOUR",
              "image": "assets/images/BabaAli/daghor.png",
            },
            {
              "orginalName": "Khadija Sakarin ",
              "movieName": "MIHIRA",
              "image": "assets/images/BabaAli/mihira.jpg",
            },
            {
              "orginalName": "Brik",
              "movieName": "BRIK",
              "image": "assets/images/BabaAli/brik.jpg",
            },
          ],
          'director': [
            {
              "orginalName": "Ahmed N'tama",
              "movieName": "Baba Ali",
              "image": "assets/images/BabaAli/babaali.jpg",
            },
            {
              "orginalName": "Mostafa Achour",
              "movieName": "None",
              "image": "assets/images/BabaAli/director.png",
            },
          ],
          'plotText':
              'Baba Ali is a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after Al Fotor. The idea of ​​the series is inspired by the old story “Ali Baba.” ”',
          // plotText =
          //     "Baba Alis a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after breakfast. The idea of ​​the series is inspired by the old story “Ali Baba.” ”",
          'productioncompany': 'WARDA PRODUCTION',
          'runtime': '0h 44m',
        }
      ]
    };
    docUser.set(json);
  }

  Future addit(movie) async {
    final docUser = FirebaseFirestore.instance.collection('movie').doc('movie');
    DocumentSnapshot doc = await docUser.get();

    //id = docUser.id;
    // final json = {
    //   'listmovies': {
    //     '2': {
    //       'title': movie.title,
    //       'year': movie.year,
    //       'backdrop': movie.backdrop,
    //       'poster': movie.poster,
    //       'numOfRatings': movie.numOfRatings,
    //       'rating': movie.rating,
    //       'criticsReview': movie.criticsReview,
    //       'metascoreRating': movie.metascoreRating,
    //       'genra': movie.genra,
    //       'plot': movie.plot,
    //       'cast': movie.cast,
    //       'director': movie.director,
    //       'plotText': movie.plotText,
    //     }
    //   }
    // };

    var json = {
      'listmovies': {
        '1': {
          'id': 1,
          'title': "ADVENGERS",
          'year': 2019,
          'poster': "assets/images/Advangers/coveradvangers.jpg",
          'backdrop': "assets/images/Advangers/backadvangers.jpg",
          'numOfRatings': 150212,
          'rating': 7.3,
          'criticsReview': 50,
          'metascoreRating': 76,
          'genra': ["Action", "Aventure", "Super Hero Movie"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "ROBERT DOWNET JR",
              "movieName": "1",
              "image": "assets/images/Advangers/RobertDowneyJr.jpeg",
            },
            {
              "orginalName": "TOM HOLLAND",
              "movieName": "2",
              "image": "assets/images/Advangers/tom-holland.jpg",
            },
            {
              "orginalName": "DON CHEADLE",
              "movieName": "3",
              "image": "assets/images/Advangers/cheadle.jpg",
            },
            {
              "orginalName": "SCARLETT JOHANSSON",
              "movieName": "4",
              "image": "assets/images/Advangers/SCARLETTJOHANSSON.webp",
            },
          ],
          'director': [
            {
              "orginalName": "ANTHONY RUSSO",
              "movieName": "Director",
              "image": "assets/images/Advangers/250993.jpg",
            },
            {
              "orginalName": "JOE RUSSO",
              "movieName": "Mollie",
              "image": "assets/images/Advangers/JOERUSSO.jpg",
            },
          ],
          'plotText':
              'The Avengers began as a group of extraordinary individuals who were assembled to defeat Loki and his Chitauri army in New York City. Since then, the team has expanded its roster and faced a host of new threats, while dealing with their own turmoil',
          'productioncompany': 'MARAVEL',
          'runtime': '3h 2 min',
        },
        '2': {
          'id': 2,
          'title': "FOCUS",
          'year': 2015,
          'poster': "assets/images/Focus/fucuscover.png",
          'backdrop': "assets/images/Focus/focus.jpg",
          'numOfRatings': 150212,
          'rating': 7.3,
          'criticsReview': 50,
          'metascoreRating': 76,
          'genra': ["Comedy", "Romantic", "Drama", "Heist"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "WILL SMITH",
              "movieName": "1",
              "image": "assets/images/Focus/will.webp",
            },
            {
              "orginalName": "MARGOT ROBBIE",
              "movieName": "2",
              "image": "assets/images/Focus/robie.jpg",
            },
            {
              "orginalName": "JUSTIANA BUSTOS",
              "movieName": "3",
              "image": "assets/images/Focus/jos.jpg",
            },
            {
              "orginalName": "B.D. WONG",
              "movieName": "4",
              "image": "assets/images/Focus/wong.jpg",
            },
          ],
          'director': [
            {
              "orginalName": "GLENN FICARRA",
              "movieName": "1",
              "image": "assets/images/Focus/glen.jpg",
            },
            {
              "orginalName": "JOHN REQUA",
              "movieName": "2",
              "image": "assets/images/Focus/john.jpg",
            },
          ],
          'plotText':
              "Will Smith stars as Nicky, a seasoned master of misdirection who becomes romantically involved with novice con artist Jess (Margot Robbie). As he's teaching her the tricks of the trade, she gets too close for comfort and he abruptly breaks it off. Three years later, the former flame—now an accomplished femme fatale—shows up in Buenos Aires in the middle of the high stakes racecar circuit. In the midst of Nicky's latest, very dangerous scheme, she throws his plans for a loop...and the consummate con man off his game.",
          'productioncompany': 'Focus Features',
          'runtime': '1h 44m',
        },
        '3': {
          'id': 3,
          'title': "Monster Hunter",
          'year': 2004,
          'backdrop': "assets/images/monster/monstercover.jpg",
          'poster': "assets/images/monster/monsterback.jpg",
          'numOfRatings': 150212,
          'rating': 8.2,
          'criticsReview': 50,
          'metascoreRating': 76,
          'genra': ["Action", "Biography", "Drama"],
          'plot': 'plotText',
          'cast': [
            {
              "orginalName": "Paul W. S. Anderson",
              "movieName": "Director",
              "image": "assets/images/monster/MillaJovovich.webp",
            },
            {
              "orginalName": "Paul W. S. Anderson",
              "movieName": "Carroll",
              "image": "assets/images/monster/PaulWSAnderson.jpg",
            },
            {
              "orginalName": "Ron Perlman",
              "movieName": "Ken Miles",
              "image": "assets/images/monster/RonPerlman.jpg",
            },
            {
              "orginalName": "Meagan Good",
              "movieName": "Mollie",
              "image": "assets/images/monster/MeaganGood.webp",
            },
          ],
          'director': [
            {
              "orginalName": "Paul W. S. Anderson",
              "image": "assets/images/monster/PaulWSAnderson.jpg",
            },
          ],
          'plotText':
              'Monster Hunter is a Japanese media franchise centered around a series of fantasy-themed action role-playing video games that started with the game Monster Hunter for PlayStation 2, released in 2004.',
          'productioncompany': 'Capcom',
          'runtime': '1h 44m',
        },
        '3': {
          'id': 4,
          'title': "Baba Ali",
          'year': 2021,
          'poster': "assets/images/BabaAli/babaalic.jpg",
          'backdrop': "assets/images/BabaAli/babaalicover.png",
          'numOfRatings': 150212,
          'rating': 9.9,
          'criticsReview': 50,
          'metascoreRating': 79,
          'genra': ["Tamazight", "Drama", "Comedy", "ROMANTIC"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "Ahmed N'tama",
              "movieName": "BABA ALI",
              "image": "assets/images/BabaAli/babaali.jpg",
            },
            {
              "orginalName": "Lhoucaine Berdaouz",
              "movieName": "DAGHOUR",
              "image": "assets/images/BabaAli/daghor.png",
            },
            {
              "orginalName": "Khadija Sakarin ",
              "movieName": "MIHIRA",
              "image": "assets/images/BabaAli/mihira.jpg",
            },
            {
              "orginalName": "Brik",
              "movieName": "BRIK",
              "image": "assets/images/BabaAli/brik.jpg",
            },
          ],
          'director': [
            {
              "orginalName": "Ahmed N'tama",
              "movieName": "Baba Ali",
              "image": "assets/images/BabaAli/babaali.jpg",
            },
            {
              "orginalName": "Mostafa Achour",
              "movieName": "None",
              "image": "assets/images/BabaAli/director.png",
            },
          ],
          'plotText':
              'Baba Ali is a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after Al Fotor. The idea of ​​the series is inspired by the old story “Ali Baba.” ”',
          // plotText =
          //     "Baba Alis a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after breakfast. The idea of ​​the series is inspired by the old story “Ali Baba.” ”",
          'productioncompany': 'WARDA PRODUCTION',
          'runtime': '0h 44m',
        },
        '4': {
          'id': 5,
          'title': "Ford v Ferrari ",
          'year': 2019,
          'poster': "assets/images/poster_2.jpg",
          'backdrop': "assets/images/backdrop_2.jpg",
          'numOfRatings': 150212,
          'rating': 8.2,
          'criticsReview': 50,
          'metascoreRating': 76,
          'genra': ["Action", "Biography", "Drama"],
          'plot': 'plotText',
          'cast': [
            {
              "orginalName": "James Mangold",
              "movieName": "Director",
              "image": "assets/images/actor_1.png",
            },
            {
              "orginalName": "Matt Damon",
              "movieName": "Carroll",
              "image": "assets/images/actor_2.png",
            },
            {
              "orginalName": "Christian Bale",
              "movieName": "Ken Miles",
              "image": "assets/images/actor_3.png",
            },
            {
              "orginalName": "Caitriona Balfe",
              "movieName": "Mollie",
              "image": "assets/images/actor_4.png",
            },
          ],
          'director': [
            {
              "orginalName": "Christian Bale",
              "movieName": "Ken Miles",
              "image": "assets/images/actor_3.png",
            },
            {
              "orginalName": "Caitriona Balfe",
              "movieName": "Mollie",
              "image": "assets/images/actor_4.png",
            },
          ],
          'plotText':
              'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
          'productioncompany': 'Chernin Entertainment',
          'runtime': '2h 32m',
        },
        '5': {
          'id': 6,
          'title': "Onward",
          'year': 2020,
          'poster': "assets/images/poster_3.jpg",
          'backdrop': "assets/images/backdrop_3.jpg",
          'numOfRatings': 150212,
          'rating': 7.6,
          'criticsReview': 50,
          'metascoreRating': 79,
          'genra': ["Action", "Drama"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "James Mangold",
              "movieName": "Director",
              "image": "assets/images/actor_1.png",
            },
            {
              "orginalName": "Matt Damon",
              "movieName": "Carroll",
              "image": "assets/images/actor_2.png",
            },
            {
              "orginalName": "Christian Bale",
              "movieName": "Ken Miles",
              "image": "assets/images/actor_3.png",
            },
            {
              "orginalName": "Caitriona Balfe",
              "movieName": "Mollie",
              "image": "assets/images/actor_4.png",
            },
          ],
          'director': [
            {
              "orginalName": "James Mangold",
              "movieName": "Director",
              "image": "assets/images/actor_1.png",
            },
            {
              "orginalName": "Matt Damon",
              "movieName": "Carroll",
              "image": "assets/images/actor_2.png",
            },
          ],
          'plotText':
              'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
          'productioncompany': 'Pixar Animation Studios',
          'runtime': '1h 42m',
        },
        '6': {
          'id': 7,
          'title': "Bloodshot",
          'year': 2020,
          'poster': "assets/images/poster_1.jpg",
          'backdrop': "assets/images/backdrop_1.jpg",
          'numOfRatings': 150212,
          'rating': 7.3,
          'criticsReview': 50,
          'metascoreRating': 76,
          'genra': ["Action", "Drama"],
          'plot': "plotText",
          'cast': [
            {
              "orginalName": "James Mangold",
              "movieName": "Director",
              "image": "assets/images/actor_1.png",
            },
            {
              "orginalName": "Matt Damon",
              "movieName": "Carroll",
              "image": "assets/images/actor_2.png",
            },
            {
              "orginalName": "Christian Bale",
              "movieName": "Ken Miles",
              "image": "assets/images/actor_3.png",
            },
            {
              "orginalName": "Caitriona Balfe",
              "movieName": "Mollie",
              "image": "assets/images/actor_4.png",
            },
          ],
          'director': [
            {
              "orginalName": "James Mangold",
              "movieName": "Director",
              "image": "assets/images/actor_1.png",
            },
            {
              "orginalName": "Caitriona Balfe",
              "movieName": "Mollie",
              "image": "assets/images/actor_4.png",
            },
          ],
          'plotText':
              'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
          'productioncompany': 'Dave WilsonDirector',
          'runtime': '1h 49m',
        },
      }
    };

    // var data = doc.data() as Map;

    // var list = [json];
    // FirebaseFirestore.instance
    //     .collection('movie')
    //     .doc('movie')
    //     .update({"listmovies": FieldValue.arrayUnion(list)});

// var collection = FirebaseFirestore.instance.collection('movie');
// collection
//     .doc('movie') // <-- Document ID
//     .set({'data': FieldValue.arrayUnion(list)}) // <-- Add data
//     .then((_) => print('Added'))
//     .catchError((error) => print('Add failed: $error'));

    //
    // // if(tag.contains(event)==true){
    // //   // docref
    // // }

    docUser.set(json);
  }
}

Future addmovie() async {
  final docUser =
      FirebaseFirestore.instance.collection('movie').doc('ROMANTIC');
  DocumentSnapshot doc = await docUser.get();
  var json = {
    'listmovies': [
      {
        'id': 2,
        'title': "FOCUS",
        'year': 2015,
        'poster': "assets/images/Focus/fucuscover.png",
        'backdrop': "assets/images/Focus/focus.jpg",
        'numOfRatings': 150212,
        'rating': 7.3,
        'criticsReview': 50,
        'metascoreRating': 76,
        'genra': ["Comedy", "Romantic", "Drama", "Heist"],
        'plot': "plotText",
        'cast': [
          {
            "orginalName": "WILL SMITH",
            "movieName": "1",
            "image": "assets/images/Focus/will.webp",
          },
          {
            "orginalName": "MARGOT ROBBIE",
            "movieName": "2",
            "image": "assets/images/Focus/robie.jpg",
          },
          {
            "orginalName": "JUSTIANA BUSTOS",
            "movieName": "3",
            "image": "assets/images/Focus/jos.jpg",
          },
          {
            "orginalName": "B.D. WONG",
            "movieName": "4",
            "image": "assets/images/Focus/wong.jpg",
          },
        ],
        'director': [
          {
            "orginalName": "GLENN FICARRA",
            "movieName": "1",
            "image": "assets/images/Focus/glen.jpg",
          },
          {
            "orginalName": "JOHN REQUA",
            "movieName": "2",
            "image": "assets/images/Focus/john.jpg",
          },
        ],
        'plotText':
            "Will Smith stars as Nicky, a seasoned master of misdirection who becomes romantically involved with novice con artist Jess (Margot Robbie). As he's teaching her the tricks of the trade, she gets too close for comfort and he abruptly breaks it off. Three years later, the former flame—now an accomplished femme fatale—shows up in Buenos Aires in the middle of the high stakes racecar circuit. In the midst of Nicky's latest, very dangerous scheme, she throws his plans for a loop...and the consummate con man off his game.",
        'productioncompany': 'Focus Features',
        'runtime': '1h 44m',
      },
    ]
  };
  docUser.set(json);
}
