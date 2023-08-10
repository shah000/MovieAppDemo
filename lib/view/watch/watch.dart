import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/movie_controller.dart';
import 'package:movieapp/model/movie/movie_model.dart';
import 'package:movieapp/utils/constants.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/app_labels.dart';
import 'package:movieapp/utils/app_size.dart';
import 'package:movieapp/utils/navigator.dart';
import 'package:movieapp/view/watch/movie_details/movie_detail.dart';
import 'package:movieapp/view/watch/movie_search/movie_search.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_loading.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          AppLabels.watch,
          style: TextStyle(color: AppColors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(const MovieSearch());
              },
              icon: Icon(
                Icons.search,
                color: AppColors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<MovieModel>(
                    future: controller.getMovies(context),
                    builder: (context, snapshot) {
                      MovieModel? movies = snapshot.data;
                      if (!snapshot.hasData) {
                        return const CustomLoading();
                      } else {
                        return SizedBox(
                          width: AppSize.width(context),
                          height: AppSize.height(context) * 0.78,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: movies!.results.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  navigateTo(MovieDetail(
                                    id: movies.results[index].id,
                                  ));
                                },
                                child: Card(
                                  elevation: 3,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Container(
                                    height: AppSize.height(context) * 0.25,
                                    width: AppSize.width(context),
                                    alignment: Alignment.bottomLeft,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      image: DecorationImage(
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          onError: (exception, stackTrace) {},
                                          image: CachedNetworkImageProvider(
                                            "${AppConstants.imageUrl}${movies.results[index].posterPath}",
                                          )),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, bottom: 25),
                                      child: Text(
                                        movies.results[index].originalTitle,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ))),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
