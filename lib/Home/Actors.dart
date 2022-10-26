import 'package:flutter/material.dart';
import 'package:movie_app/Home/Movie.dart';

class Actors extends StatefulWidget {
  const Actors({super.key});

  @override
  State<Actors> createState() => _ActorsState();
}

class _ActorsState extends State<Actors> {
  late PageController _pageController;
  int initialPage = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: AspectRatio(
            aspectRatio: 1.3,
            child: PageView.builder(
                //controller: _pageController,
                itemCount: movies.length,
                itemBuilder: (context, index) =>
                    MovieCard(movie: movies[index]))));
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return casta(
      cast: movie.cast,
    );
  }
}

class casta extends StatelessWidget {
  const casta({super.key, required this.cast});
  final List cast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   "Cast & Crew",
          //   style: Theme.of(context).textTheme.headline5,
          // ),
          //SizedBox(height: 30),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) => CastCard(cast: cast[index]),
            ),
          )
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.cast});
  final Map cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      width: 60,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          Text(
            cast['movieName'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white10),
          ),
        ],
      ),
    );
  }
}
