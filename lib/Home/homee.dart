import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/moviebloc/movie_bloc.dart';
import 'package:movie_app/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_app/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_app/model/movie.dart';

// ignore: camel_case_types
class homee extends StatelessWidget {
  const homee({super.key});

  @override
  Widget build(BuildContext context) {
    /// final user = FirebaseAuth.instance.currentUser!;

    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(
              create: (_) => MovieBloc()..add(const MovieEventStarted(0, ''))),
        ],
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            leading: const Icon(
              Icons.menu,
              color: Colors.black45,
            ),
            title: Center(
              child: Text(
                "Movies Guid".toUpperCase(),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'Kaisei_Tokumin',
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              )
            ],
          ),

          body: _buildBody(context),
          // Padding(
          //   padding: const EdgeInsets.all(32),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       // const Text(
          //       //   'Signed In as',
          //       //   style: TextStyle(fontSize: 16),
          //       // ),
          //       // const SizedBox(
          //       //   height: 6,
          //       // ),
          //       // Text(
          //       //   user.email! + user.uid,
          //       //   style: const TextStyle(fontSize: 20),
          //       // ),
          //       // const SizedBox(
          //       //   height: 40,
          //       // ),
          //       ElevatedButton.icon(
          //         style: ElevatedButton.styleFrom(
          //             minimumSize: const Size.fromHeight(50)),
          //         icon: const Icon(
          //           Icons.arrow_back,
          //           size: 32,
          //         ),
          //         // ignore: prefer_const_constructors
          //         label: Text(
          //           'Sign Out',
          //           style: const TextStyle(fontSize: 24),
          //         ),
          //         onPressed: () => FirebaseAuth.instance.signOut(),
          //       ),
          //     ],
          //   ),
          // ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BlocBuilder<MovieBloc, MovieState>(
                builder: ((context, state) {
                  if (state is MovieLoading) {
                    print("heyy1");
                    return Center(
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    );
                  } else if (state is MovieLoaded) {
                    List<Movie> movies = state.movieList;
                    print("heyy2");
                    print(movies.length);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, realIndex) {
                            Movie movie = movies[index];
                            print(movie.backdropPath);
                            return Stack(
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Platform
                                            .isAndroid
                                        ? const CircularProgressIndicator()
                                        : const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/img_not_found.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            pauseAutoPlayOnTouch: true,
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ],
                    );
                  } else {
                    print("heyy3");
                    return Container(
                      child: Text('Somthig wrong'),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
