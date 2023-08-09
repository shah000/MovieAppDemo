// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/movie_controller.dart';
import 'package:movieapp/utils/app_size.dart';
import 'package:movieapp/utils/navigator.dart';
import 'package:movieapp/view/watch/movie_details/get_tikects/select_seats.dart';
import 'package:movieapp/view/watch/movie_details/widgets/watch_trailer_button.dart';
import 'package:movieapp/view/widgets/custom_blue_button.dart';

import '../../../model/movie/movie_detail_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_labels.dart';
import '../../../utils/date_format.dart';
import '../../widgets/loading_dialog.dart';
import 'watch_trailer/watch_trailer.dart';
import 'widgets/genres_and_overview.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, this.id});
  final dynamic id;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final controller = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<MovieDetailModel>(
        future: controller.getMovieDeatil(context: context, movieId: widget.id),
        builder: (context, snapshot) {
          MovieDetailModel? movies = snapshot.data;
          if (!snapshot.hasData) {
            return const LoadingDialog();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: AppSize.width(context),
                        height: AppSize.height(context) * 0.50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                '${AppConstants.imageUrl}${movies!.posterPath}',
                              )),
                        ),
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    navigateBack();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.white,
                                  )),
                              Text(
                                AppLabels.watch,
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 00,
                        right: 60,
                        left: 60,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppSize.height(context) * 0.08,
                              ),
                              Text(
                                AppLabels.inTheaters +
                                    DateFormatter.getFormatedDate(
                                        movies.releaseDate.toString()),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: AppSize.height(context) * 0.02,
                              ),
                              CustomBlueButton(
                                title: AppLabels.getTickets,
                                onTap: () {
                                  navigateTo(SelectSeats(
                                    movieName: movies.originalTitle,
                                    movieReleaseDate: AppLabels.inTheaters +
                                        DateFormatter.getFormatedDate(
                                            movies.releaseDate.toString()),
                                  ));
                                },
                              ),
                              SizedBox(
                                height: AppSize.height(context) * 0.02,
                              ),
                              WatchTrailerButton(
                                onTap: () {
                                  navigateTo(WatchTrailer(
                                    moiveId: widget.id,
                                  ));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.height(context) * 0.02,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 15),
                    child: GenresAndOverView(movies: movies),
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
