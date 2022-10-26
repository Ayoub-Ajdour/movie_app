import 'package:flutter/material.dart';
import 'package:movie_app/Details/components/BodyDetail.dart';
import 'package:movie_app/Home/Movie.dart';

class DetailsScreen extends StatelessWidget {
  final int movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetail(movie: movie),
    );
  }
}
