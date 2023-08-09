import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/movie_controller.dart';
import 'package:movieapp/model/movie/search_movie_model.dart';
import 'package:movieapp/utils/app_images.dart';
import 'package:movieapp/utils/app_labels.dart';
import 'package:movieapp/utils/app_size.dart';

import '../../../utils/constants.dart';
import '../../../utils/app_colors.dart';

class MovieSearch extends StatefulWidget {
  const MovieSearch({super.key});

  @override
  State<MovieSearch> createState() => _MovieSearchState();
}

String searchQuery = '';
TextEditingController searchTextEditingController = TextEditingController();

class _MovieSearchState extends State<MovieSearch> {
  final controller = Get.put(MovieController());
  @override
  void initState() {
    searchQuery = '';
    searchTextEditingController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
          preferredSize:
              Size(AppSize.width(context), AppSize.height(context) * 0.10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.white,
                title: TextFormField(
                  controller: searchTextEditingController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.black,
                      ),
                      contentPadding: const EdgeInsets.all(8.0),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searchQuery = '';
                            searchTextEditingController.clear();
                          });
                        },
                        icon: const Icon(Icons.close),
                        color: AppColors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintStyle: TextStyle(fontSize: 12, color: AppColors.grey),
                      hintText: AppLabels.serachLabel),
                )),
          )),
      body: SafeArea(
          child: searchQuery == ''
              ? const Center(child: Text("Not Data Found"))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<SearchMovieModel>(
                    future: controller.srechByMovieName(query: searchQuery),
                    builder: (context, snapshot) {
                      SearchMovieModel? movies = snapshot.data;
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppLabels.topresults,
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  const Divider(),
                                  SizedBox(
                                    width: AppSize.width(context),
                                    height: AppSize.height(context) * 0.80,
                                    child: ListView.builder(
                                      itemCount: movies!.results.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: AppSize.width(context) *
                                                    0.40,
                                                height: AppSize.width(context) *
                                                    0.38,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  image: DecorationImage(
                                                      alignment:
                                                          Alignment.center,
                                                      fit: BoxFit.cover,
                                                      onError: (exception,
                                                          stackTrace) {},
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        "${AppConstants.imageUrl}${movies.results[index].posterPath}",
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                width: AppSize.width(context) *
                                                    0.03,
                                              ),
                                              SizedBox(
                                                width: AppSize.width(context) *
                                                    0.40,
                                                height: AppSize.width(context) *
                                                    0.38,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      movies.results[index]
                                                          .originalTitle,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      "Fantasy",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textgreyColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              SvgPicture.asset(AppImages.menu),
                                              SizedBox(
                                                width: AppSize.width(context) *
                                                    0.02,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ))),
    );
  }
}
