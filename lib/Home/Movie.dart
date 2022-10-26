// Our movie model
import 'package:flutter/foundation.dart';

class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot,
      title,
      poster,
      backdrop,
      plotText,
      runtime,
      productioncompany;
  final List<Map> cast;
  final List<Map> director;

  Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genra,
    required this.plot,
    required this.cast,
    required this.director,
    required this.plotText,
    required this.runtime,
    required this.productioncompany,
  });
}

Future fromJson(dynamic json) async {
  if (json == null) {
    return Movie(
        backdrop: '',
        cast: [],
        criticsReview: 0,
        director: [],
        genra: [],
        id: 0,
        metascoreRating: 0,
        numOfRatings: 0,
        plot: '',
        plotText: '',
        poster: '',
        productioncompany: '',
        rating: 0,
        runtime: '',
        title: '',
        year: 0);
  }
  print("heeytttttttttttttttttttttttttttttttttte" + json['backdrop_path']);
  return Movie(
      backdrop: json['backdrop'],
      cast: json['cast'],
      criticsReview: json['criticsReview'],
      director: json['director'],
      genra: json['genra'],
      id: json['id'],
      metascoreRating: json['metascoreRating'],
      numOfRatings: json['numOfRatings'],
      plot: json['plot'],
      plotText: json['plotText'],
      poster: json['poster'],
      productioncompany: json['productioncompany'],
      rating: json['rating'],
      runtime: json['runtime'],
      title: json['title'],
      year: json['year']);
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "ADVENGERS",
    year: 2019,
    poster: "assets/images/Advangers/coveradvangers.jpg",
    backdrop: "assets/images/Advangers/backadvangers.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Aventure", "Super Hero Movie"],
    plot: "plotText",
    cast: [
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
    director: [
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
    plotText:
        'The Avengers began as a group of extraordinary individuals who were assembled to defeat Loki and his Chitauri army in New York City. Since then, the team has expanded its roster and faced a host of new threats, while dealing with their own turmoil',
    productioncompany: 'MARAVEL',
    runtime: '3h 2 min',
  ),
  Movie(
    id: 2,
    title: "FOCUS",
    year: 2015,
    poster: "assets/images/Focus/fucuscover.png",
    backdrop: "assets/images/Focus/focus.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Comedy", "Romantic", "Drama", "Heist"],
    plot: "plotText",
    cast: [
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
    director: [
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
    plotText:
        "Will Smith stars as Nicky, a seasoned master of misdirection who becomes romantically involved with novice con artist Jess (Margot Robbie). As he's teaching her the tricks of the trade, she gets too close for comfort and he abruptly breaks it off. Three years later, the former flame—now an accomplished femme fatale—shows up in Buenos Aires in the middle of the high stakes racecar circuit. In the midst of Nicky's latest, very dangerous scheme, she throws his plans for a loop...and the consummate con man off his game.",
    productioncompany: 'Focus Features',
    runtime: '1h 44m',
  ),
  Movie(
    id: 3,
    title: "Monster Hunter",
    year: 2004,
    backdrop: "assets/images/monster/monstercover.jpg",
    poster: "assets/images/monster/monsterback.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Biography", "Drama"],
    plot: 'plotText',
    cast: [
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
    director: [
      {
        "orginalName": "Paul W. S. Anderson",
        "image": "assets/images/monster/PaulWSAnderson.jpg",
      },
    ],
    plotText:
        'Monster Hunter is a Japanese media franchise centered around a series of fantasy-themed action role-playing video games that started with the game Monster Hunter for PlayStation 2, released in 2004.',
    productioncompany: 'Capcom',
    runtime: '1h 44m',
  ),
  Movie(
    id: 4,
    title: "Baba Ali",
    year: 2021,
    poster: "assets/images/BabaAli/babaalic.jpg",
    backdrop: "assets/images/BabaAli/babaalicover.png",
    numOfRatings: 150212,
    rating: 9.9,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Tamazight", "Drama", "Comedy", "ROMANTIC"],
    plot: "plotText",
    cast: [
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
    director: [
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
    plotText:
        'Baba Ali is a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after Al Fotor. The idea of ​​the series is inspired by the old story “Ali Baba.” ”',
    // plotText =
    //     "Baba Alis a Moroccan Amazigh comedy television series, Soussi, speaking in Tachelhit, produced in 2021 (Part 1) and 2022 (Part 2). With the beginning of Ramadan 2021, Channel Eight began broadcasting its episodes every day after breakfast. The idea of ​​the series is inspired by the old story “Ali Baba.” ”",
    productioncompany: 'WARDA PRODUCTION',
    runtime: '0h 44m',
  ),
  Movie(
    id: 5,
    title: "Ford v Ferrari ",
    year: 2019,
    poster: "assets/images/poster_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Biography", "Drama"],
    plot: 'plotText',
    cast: [
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
    director: [
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
    plotText:
        'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
    productioncompany: 'Chernin Entertainment',
    runtime: '2h 32m',
  ),
  Movie(
    id: 6,
    title: "Onward",
    year: 2020,
    poster: "assets/images/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: "plotText",
    cast: [
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
    director: [
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
    plotText:
        'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
    productioncompany: 'Pixar Animation Studios',
    runtime: '1h 42m',
  ),
  Movie(
    id: 7,
    title: "Bloodshot",
    year: 2020,
    poster: "assets/images/poster_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Drama"],
    plot: "plotText",
    cast: [
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
    director: [
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
    plotText:
        'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
    productioncompany: 'Dave WilsonDirector',
    runtime: '1h 49m',
  ),
];

// String plotText =
//     "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
