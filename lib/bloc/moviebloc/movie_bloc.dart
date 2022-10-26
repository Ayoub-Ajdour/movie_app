import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/moviebloc/movie_bloc_event.dart';
import 'package:movie_app/bloc/moviebloc/movie_bloc_state.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/service/api_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getNowPlayingMovie();
        yield MovieLoaded(movieList);
      } else {
        print(movieId);
        //  movieList = await service.getMovieByGenre(movieId);
        // movieList = await service.getNowPlayingMovie();
      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      yield MovieError();
    }
  }
}
