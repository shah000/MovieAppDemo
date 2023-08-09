import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../model/movie/movie_detail_model.dart';
import '../model/movie/movie_model.dart';
import 'package:http/http.dart' as http;

import '../model/movie/movie_video_model.dart';
import '../model/movie/search_movie_model.dart';
import '../utils/constants.dart';

class ApiServices {
  Future<MovieModel> getMovies() async {
    final http.Response response = await http.get(
      Uri.parse(ApiConstants.getMoviesUrl),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return MovieModel.fromJson(json.decode(response.body));
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed gettingMovies');
      }
    } catch (e) {
      throw Exception('Failed gettingMovies');
    }
  }

  Future<MovieDetailModel> getMovieDeatil({required int movieId}) async {
    final http.Response response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl} $movieId?api_key=3d71e92264ca58376692e42479e39d2f'),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return MovieDetailModel.fromJson(json.decode(response.body));
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed gettingMovieDeatil');
      }
    } catch (e) {
      throw Exception('Failed gettingMovieDeatil');
    }
  }

  Future<MovieVideolModel> fetchTrailers({required int movieId}) async {
    final http.Response response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl} $movieId/videos?api_key=3d71e92264ca58376692e42479e39d2f'),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return MovieVideolModel.fromJson(json.decode(response.body));
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed gettingMovieVideos');
      }
    } catch (e) {
      throw Exception('Failed gettingMovieVideos');
    }
  }

  Future<SearchMovieModel> searchMovies({required String query}) async {
    final http.Response response = await http.get(
      Uri.parse(
          '${ApiConstants.moviesSearchUrl}$query&api_key=3d71e92264ca58376692e42479e39d2f'),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return SearchMovieModel.fromJson(json.decode(response.body));
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed searchMovies');
      }
    } catch (e) {
      throw Exception('Failed searchMovies');
    }
  }
}
