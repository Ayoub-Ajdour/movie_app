import 'package:dio/dio.dart';
import 'package:movie_app/model/movie.dart';
import 'dart:core';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=48aae079c98772adabefad8422990fa9';

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      print("Api called");
      // final url = '$baseUrl/movie/now_playing?$apiKey';
      const url =
          'https://api.themoviedb.org/3/movie/550?api_key=48aae079c98772adabefad8422990fa9';
      final response = await _dio.get(url);
      print("9BL KOLCHI");
      //var movies = response.data as List;
      print("9bel");
      List<Movie> movieList =
          (response.data as List).map((m) => Movie.fromJson(m)).toList();
      print("be3d");

      return movieList;
    } catch (error, stacktrace) {
      print(error);
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
