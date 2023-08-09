// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:get/get.dart';
import 'package:movieapp/model/movie/movie_detail_model.dart';
import 'package:movieapp/model/movie/movie_model.dart';
import 'package:movieapp/model/movie/movie_video_model.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/utils/app_labels.dart';
import 'package:movieapp/view/widgets/custom_flushbar_message.dart';

import '../model/movie/search_movie_model.dart';

class MovieController extends GetxController {
  MovieDetailModel? movieDetailModel;
  MovieModel? movieModel;
  MovieVideolModel? movieVideosModel;
  SearchMovieModel? searchMovieModel;
  MovieModel? searchResults;

  Future<MovieModel> getMovies(context) async {
    try {
      movieModel = await ApiServices().getMovies();
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg(
          AppLabels.somethingWentWrong, context);
    }
    return movieModel!;
  }

  Future<MovieDetailModel> getMovieDeatil(
      {context, required int movieId}) async {
    try {
      movieDetailModel = await ApiServices().getMovieDeatil(movieId: movieId);
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg(
          AppLabels.somethingWentWrong, context);
    }
    return movieDetailModel!;
  }

  Future<MovieVideolModel> getMovieTrailer(
      {context, required int movieId}) async {
    try {
      movieVideosModel = await ApiServices().fetchTrailers(movieId: movieId);
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg(
          AppLabels.somethingWentWrong, context);
    }
    return movieVideosModel!;
  }

  Future<SearchMovieModel> srechByMovieName(
      {required String query, context}) async {
    try {
      searchMovieModel = await ApiServices().searchMovies(query: query);
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg(
          AppLabels.somethingWentWrong, context);
    }
    return searchMovieModel!;
  }
}
